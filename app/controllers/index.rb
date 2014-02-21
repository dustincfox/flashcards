get '/' do
  erb :index
end

get '/decks' do
  @deck = Deck.all
  erb :list_cards
end

get '/about' do
  erb :credits
end

get '/round/new/?' do
  # session.clear
  @decks = Deck.all
  erb :new_round
end

post '/round/create' do

  # erb params.inspect
  @deck = Deck.find(params[:deck_id].to_i)
  @deck_id = @deck.id
  Round.create(deck_id: @deck_id, user_id: 1) #session[:user_id])
  #erb @deck.cards
  session[:cards] = @deck.cards.map(&:id)
  redirect to("/round/next")
 # erb "deck: #{session[:cards].map {|n| n.id}} \n card pulled: #{@card.id} "
  #redirect to("/round/#{session[:cards].shuffle.pop.id}")
end

# get '/round/:card_id/?' do
#   @current_card = Card.find(params[:card_id].to_i)
#   @prompt = @current_card.question
#   @answer = @current_card.answer
# end

get '/round/next' do
  # erb session[:cards]
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
  @guess = params[:answer].downcase
  @answer = Card.find(params[:card_id].to_i).answer.downcase
  @outcome = "Sorry, the correct answer is #{@answer}."
  @outcome = "Nice job Walrus" if @answer == @guess
  erb :result
end


get '/round/complete/?' do

end
