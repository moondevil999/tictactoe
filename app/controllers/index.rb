

def not_login?
  return true if session[:name].nil?
  return false
end

get '/' do
  erb :index
end

post '/sign_up' do
  @user = User.create(params[:user])

  if @user.valid?
    session[:name] = @user.name
    redirect to('/home')
  else
    redirect to('/error_page')
  end
end

post '/login' do
  if @user = User.authenticate(params[:user][:name], params[:user][:password])
    session[:name] = @user.name
    redirect to('/home')
  end

  redirect to('/error_page')
end

get '/logout' do
  session[:name] = nil
  redirect "/"
end

get '/home' do
  if not_login?
    redirect to('/error_page')
  end
  @games = Game.where(ended:false)
  erb :home
end

get '/error_page' do
  erb :error_page
end