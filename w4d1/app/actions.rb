# Homepage (Root path)
helpers do
  def admin? 
    request.cookies['login'] == 'true'
  end

  def protected!
    if admin? != true
      halt [ 401, 'Not Authorized' ]
    else
      return true
    end
  end
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
  protected!
  @tracks = Track.all
  erb :'tracks/index'
end

get '/login' do
  erb :'login/login'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'

end

get '/tracks/:id' do
  @track = Track.find params[:id]
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
  binding.pry
  if @vote.save
    redirect '/tracks'
  else
    "you already voted"
  end
end

post '/login' do
  if User.where(:username => params['username']).pluck(:password)[0] == params['password']
    id = User.where(:username => params['username']).pluck(:id)[0]
    response.set_cookie('login',true)
    response.set_cookie('user_id', id)
    
    redirect '/tracks'
  else
    "Username or Password incorrect"
  end
end