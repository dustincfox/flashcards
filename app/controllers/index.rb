get '/' do
  erb :index
end

get '/decks/?' do
  @decks = Deck.all
  erb :list_cards
end

get '/round/new/?' do
  @decks = Deck.all
  erb :new_round
end

post '/round/create' do
  @deck = Deck.find(params[:deck_id].to_i)
  @deck_id = @deck.id
  @user_id = User.where(username: session[:username]).first.id
  session[:user_id] = @user_id
  @round = Round.create(deck_id: @deck_id, user_id: @user_id)
  session[:round_id] = @round.id
  session[:cards] = @deck.cards.map(&:id)
  session[:right_count] = 0
  session[:wrong_count] = 0
  redirect to("/round/next")
end

get '/round/next/?' do
  @stats_display = true
  #redirect to("/round/complete/") if session[:cards].empty?
  redirect to("/complete/") if session[:cards].empty?
  @shuffled_cards = session[:cards].shuffle
  @card = Card.find(@shuffled_cards.pop.to_i)
  session[:cards] = @shuffled_cards
  redirect to("/round/#{@card.id}")
end

get '/round/:card_id/?' do
  @stats_display = true
  @current_card = Card.find(params[:card_id].to_i)
  erb :question
end

post '/round/:card_id/outcome' do
  @stats_display = true
  @guess = params[:answer]
  @card = Card.find(params[:card_id].to_i)
  @answer = @card.answer
  if @answer == @guess
    Guess.create(round_id: session[:round_id], user_id: session[:user_id], result: true)
    session[:right_count] += 1
    @outcome = "Nice job Walrus"
  else
    Guess.create(round_id: session[:round_id], user_id: session[:user_id], result: false)
    session[:wrong_count] += 1
    @outcome = "Sorry, the correct answer is #{@answer}."
  end
  if request.xhr?
    erb :result, layout: false
  else
    erb :result
  end
end


get '/complete/?' do
  session[:right_count] = 0
  session[:wrong_count] = 0
  erb :victory
end
