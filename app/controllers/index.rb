get '/' do
  erb :index
end

get '/decks/?' do
  @deck = Deck.all
  erb :list_cards
end

get '/round/new/?' do
  @decks = Deck.all
  erb :new_round
end

post '/round/create' do
  @deck = Deck.find(params[:deck_id].to_i)
  @deck_id = @deck.id
  @round = Round.create(deck_id: @deck_id, user_id: session[:user_id]) #session[:user_id])
  session[:round_id] = @round.id
  session[:cards] = @deck.cards.map(&:id)
  session[:right_count] = 0
  session[:wrong_count] = 0
  redirect to("/round/next")
end

get '/round/next/?' do
  redirect to("/complete/") if session[:cards].empty?
  @shuffled_cards = session[:cards].shuffle
  @card = Card.find(@shuffled_cards.pop.to_i)
  session[:cards] = @shuffled_cards
  redirect to("/round/#{@card.id}")
end

get '/round/:card_id/?' do
  @current_card = Card.find(params[:card_id].to_i)
  erb :question
end

post '/round/:card_id/outcome' do
  @guess = params[:answer]
  @card = Card.find(params[:card_id].to_i)
  @answer = @card.answer
  if @answer == @guess
    puts "\n\n\n\n\n\n\n\n"
    puts session[:round_id]
    puts "\n\n\n\n\n\n\n\n"
    Guess.create(round_id: session[:round_id], user_id: session[:user_id], result: true)
    session[:right_count] += 1
    @outcome = "Nice job Walrus"
  else
    Guess.create(deck_id: @card.deck.id, user_id: session[:user_id], result: false)
    session[:wrong_count] += 1
    @outcome = "Sorry, the correct answer is #{@answer}."
  end
  erb :result
end


get '/complete/?' do
  session[:right_count] = 0
  session[:wrong_count] = 0
  erb :victory
end
