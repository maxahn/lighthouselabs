# Homepage (Root path)
helpers do
  def logged_in? 
    request.cookies['login'] == 'true'
  end

  def protected!
    if logged_in? != true
      halt [ 401, 'Not Authorized' ]
    end
  end

  @login_error = false
end

get '/' do
  erb :index
end

get('/logout') do
  response.set_cookie('login', false)
  response.set_cookie('user_id', nil)
  redirect '/'
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/login' do
  erb :'logins/index'
end

get '/signup' do
  @user = User.new
  erb :'logins/new'
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
  )
  if @user.save
    redirect '/login'
  else
    erb :'logins/new'
  end
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'

end

get '/tracks/:id' do
  @track = Track.find params[:id]
  @reviews = Review.where(:track_id => @track.id)
  erb :'tracks/show'
end

post '/tracks' do
  @track = Track.new(
    title: params[:title],
    url: params[:url],
    author:  params[:author],
    user_id: request.cookies['user_id']
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

post '/votes' do
  @vote = Vote.new(
    track_id: params[:track_id],
    user_id: request.cookies['user_id']
  )
  if @vote.save
    redirect '/tracks'
  else
    "you already voted"
  end
end

post '/reviews' do
  @review = Review.new(
    review: params[:review],
    track_id: params[:track_id],
    user_id: request.cookies['user_id']
  )
  if @review.save
    redirect "/tracks/#{params[:track_id]}"
  else
    "you already reviewed this song"
  end
end

post '/deletereviews' do
  Review.find(params[:review_id]).destroy
  redirect "/tracks/#{params[:track_id]}"
end


post '/login' do
  if User.where(:username => params['username']).pluck(:password)[0] == params['password']
    id = User.where(:username => params['username']).pluck(:id)[0]
    response.set_cookie('login',true)
    response.set_cookie('user_id', id)
    
    @login_error = false
    redirect '/tracks'
  else
    @login_error = true
    erb :'logins/index'
  end
end