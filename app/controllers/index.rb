require 'rubygems'
require 'sinatra'

get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  @block = "#{params}"
  erb :index
end

get '/cool_url' do
  puts "[LOG] Getting /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  @input = params
  erb :get_cool_url
end

post '/cool_url' do
  puts "[LOG] Posting to /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  @post = params
  erb :post_cool_url
end

get '/round/question' do

end

get '/round/question/answer' do

end

get '/round/question/prompt' do

end

get '/round/complete' do

end

get '/round/new' do

end

