class SongsController < ApplicationController
  get '/songs' do

    erb :"songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    if !params[:artist][:name].empty?
      @song = Song.create(name: params[:name], artist: Artist.find_or_create_by(name: params[:artist][:name]), genre: params[:genre])
    else
      @song = Song.create(name: params[:name], artist: Artist.find(params[:artist][:id]), genre_ids: params[:genres])
    end
    @song.save
    redirect :'/songs/#{@song.slug}'
  end
end
