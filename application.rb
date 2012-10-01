require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'haml'

get '/' do
  haml :index
end

get '/albums' do
  albumsPath = File.open('pitchfork_albums.html')
  albumsData = Nokogiri::HTML(albumsPath.read, nil, 'utf-8')
  @albums = albumsData.css('li')
  haml :albums
end

get '/tracks' do
  tracksPath = File.open('pitchfork_tracks.html')
  tracksData = Nokogiri::HTML(tracksPath.read, nil, 'utf-8')
  @tracks = tracksData.css('li')
  haml :tracks
end


