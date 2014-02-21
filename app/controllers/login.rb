get '/login' do
  if !session[:username].nil?
    redirect to('/profile')
  else
    erb :login_screen
  end
end

post '/login' do
  if User.new.authenticate(params[:username],params[:password])
    session[:username] = params[:username]
    redirect to('/profile')
  else
    erb :_login_responce, :locals => {message: "Failed: you done fucked up"}
  end
end

get '/logout' do
  if !session[:username].nil?
    session.clear
    redirect to('/')
  end
end
#we actually handle the session check on the erb so it
#gives more freedom for the template designers
get '/profile' do
  erb :profile
end

get '/decks' do
  erb :decks
end

post '/updatePass' do
  user_name= params[:uname]
  new_pass = params[:newPass]
  confirm  = params[:newPassConfirm]
  if new_pass == confirm
    user_obj = User.where('username = ?',user_name).first
    if !user_obj.nil?
      #FIXME: this will need to rely on dustins encrypt changes
      user_obj.update_attributes(password: User.encrypt(new_pass))
      redirect to('/profile')
    end
  end
end

post '/updateUname' do
  old_name  = params[:oldName]
  user_name = params[:userName]

  user_obj = User.where('username = ?',old_name).first
  if !user_obj.nil?
    user_obj.update_attributes(username: user_name)
  end
  session[:username] = user_name
  redirect to('/profile')
end
