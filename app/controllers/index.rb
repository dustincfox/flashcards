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
  # if @user_id
    @user_id = User.where(username: session[:username]).first.id
    session[:user_id] = @user_id
  # end
  @round = Round.create(deck_id: @deck_id, user_id: @user_id)
  session[:round_id] = @round.id
  session[:cards] = @deck.cards.map(&:id)
  session[:deck_size] = @deck.cards.length
  session[:right_count] = 0
  session[:wrong_count] = 0
  redirect to("/round/next")
end

get '/round/next/?' do
  @stats_display = true
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
  
  if @answer.downcase.strip == @guess.downcase.strip
    Guess.create(round_id: session[:round_id], user_id: session[:user_id], result: true)
    session[:right_count] += 1
    @feedback = "good"
    @outcome = "Nice job, you giant Walrus"
  else
    Guess.create(round_id: session[:round_id], user_id: session[:user_id], result: false)
    #Guess.create(deck_id: @card.deck_id, user_id: session[:user_id], result: false)
    session[:wrong_count] += 1
    @feedback = "bad"
    @outcome = "Sorry, the correct answer is #{@answer}."
  end
  if request.xhr?
    erb :result, layout: false
  else
    erb :result
  end
end

get '/complete/?' do
  @right = session[:right_count].to_i
  @deck_size = session[:deck_size].to_i
  session[:right_count] = 0
  session[:wrong_count] = 0
  erb :victory
end
