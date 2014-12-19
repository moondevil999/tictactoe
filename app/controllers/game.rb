get '/game' do
  erb :game
end

get '/game/create' do
  player = User.find_by_name(session[:name])
  game = Game.create(p1_id:player.id)
  redirect to ("/game/#{game.id}/lobby")
end

get '/game/:g_id/start' do
  puts "Game starts"
  @game = Game.find(params[:g_id])
  @player1 = User.find(@game.p1_id)
  @player2 = User.find(@game.p2_id)
  @game.starting_player_id = @player1.id
  @currentplayer = User.find_by_name(session[:name])
  @game.save
  erb :game
end

get '/game/:g_id/lobby' do
  @game = Game.find(params[:g_id])
  erb :lobby
end

get '/game/:g_id/join' do
  game = Game.find(params[:g_id])
  game.p2_id = User.find_by_name(session[:name]).id
  game.save
  redirect to ("/game/#{game.id}/lobby")
end