get '/' do

  erb :index
end


post '/login' do

end


post '/logout' do

end

get '/round/new/?' do
  @decks = Deck.all
  erb :new_round
end

get '/round/:card_id/?' do
  @current_card = Card.find(params[:card_id].to_i)
  @prompt = @current_card.question
  @answer = @current_card.answer
end

post '/round/new' do

end

get '/round/question/answer/?' do

end

get '/round/question/prompt/?' do

end

get '/round/complete/?' do

end



