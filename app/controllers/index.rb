get '/' do
  erb :index
end

get '/round/new/?' do
  @decks = Deck.all
  erb :new_round
end

post '/round/create' do
  @deck = Deck.find(params[:deck_id].to_i)
  @deck_id = @deck.id
  Round.create(deck_id: @deck_id, user_id: 1)

  session[:cards] = @deck.cards.map(&:id)
  session[:right_count] = 0
  session[:wrong_count] = 0
  redirect to("/round/next")
end

get '/round/next/?' do
  redirect to("/complete/") if session[:cards].empty?
  @shuffled_cards = session[:cards].shuffle
  @card = Card.find(@shuffled_cards.pop.to_i)
  session[:current] = @card.id
  session[:cards] = @shuffled_cards
  redirect to("/round/#{@card.id}")
end

get '/round/:card_id/?' do
  @current_card = Card.find(params[:card_id].to_i)
  erb :question
end

post '/round/:card_id/outcome' do
  @guess = params[:answer]

  @answer = Card.find(params[:card_id].to_i).answer
  if @answer == @guess
    session[:right_count] += 1
    puts session
    @outcome = "Nice job Walrus" 
  else
    session[:wrong_count] += 1
    session[:cards] << session[:current]
    @outcome = "Sorry, the correct answer is #{@answer}."
  end

  erb :result
end


get '/complete/?' do
  session[:right_count] = 0
  session[:wrong_count] = 0  
  erb :victory
end



