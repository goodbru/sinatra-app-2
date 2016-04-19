# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @song = Song.all
  erb:'songs/index'
end

get '/songs/new' do
  erb:'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb:'songs/new'
  end
end

get '/songs/:id' do 
  @song = Song.find params[:id]
  erb:'songs/show'
end

get '/sign_in' do
  erb:'sign_in'
end

get '/sign_up' do
  erb:'sign_up'
end