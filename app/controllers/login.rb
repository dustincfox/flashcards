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
    erb :_login_response, :locals => {message: "Something is wrong with your username or password"}
  end
end

get '/logout' do
  if !session[:username].nil?
    session.clear
    redirect to('/')
  end
end

post '/createAccount' do
  User.create(username: params[:username],password: params[:password])
  redirect to('/login')
end
#we actually handle the session check on the erb so it
#gives more freedom for the template designers
get '/profile' do
  @user_id = User.where(username: session[:username]).first.id
  session[:user_id] = @user_id
  @user = User.find(session[:user_id].to_i)
  @rounds_played = @user.rounds.count
  @decks = User.find(1).decks.map(&:name)
  erb :profile
end

get '/decks' do
  erb :decks
end

post '/updatePass' do
  user_name= params[:uName]
  new_pass = params[:newPass]
  confirm  = params[:newPassConfirm]
  if new_pass == confirm
    user_obj = User.where('username = ?',user_name).first
    if !user_obj.nil?
      user_obj.update_attributes(password: new_pass)
      redirect to('/profile')
    end
  end
end

post '/updateUname' do
  old_name  = params[:oldName]
  user_name = params[:userName]

  user_obj = User.where('username = ?',old_name).first
  puts "LOG: #{old_name}"
  if !user_obj.nil?
    user_obj.update_attributes(username: user_name)
  end
  session[:username] = user_name
  redirect to('/profile')
end
