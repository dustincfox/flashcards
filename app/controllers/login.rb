get '/login' do
  erb :login_screen
end

post '/login' do
  if User.authenticate(params[:username],params[:password])
    erb :_login_responce, :locals => {message: "Passed: Welcome Commander"}
  else
    erb :_login_responce, :locals => {message: "Failed: you done fucked up"}
  end
end
