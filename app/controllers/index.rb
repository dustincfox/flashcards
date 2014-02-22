get '/' do
  erb :index
end

get '/decks/?' do
  @deck = Deck.all
  erb :list_cards
end

get '/about/?' do
  erb :credits
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
  Round.create(deck_id: @deck_id, user_id: @user_id) #session[:user_id])
  session[:cards] = @deck.cards.map(&:id)
  session[:right_count] = 0
  session[:wrong_count] = 0
  redirect to("/round/next")
end

get '/round/next/?' do
  # erb session[:cards]
  redirect to("/round/complete/") if session[:cards].empty?
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
    Guess.create(deck_id: @card.deck.id, )
    session[:right_count] += 1
    @outcome = "Nice job Walrus"
  else
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
