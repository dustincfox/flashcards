require 'digest/md5'



get '/login' do
  erb :login_screen
end

post '/login' do
  if User.authenticate(params[:username],params[:password])
    puts "passed Welcome Commander"
  else
    puts "you done fucked up"
  end
end
