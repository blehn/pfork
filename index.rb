require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'haml'


get '/' do
  albumsPath = File.open('pitchfork_albums.html')
  albumsData = Nokogiri::HTML(albumsPath.read, nil, 'utf-8')
  @albums = albumsData.css('li')
  haml :index
end



