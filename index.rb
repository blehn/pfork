require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'haml'


get '/' do
  albumsPath = File.open('pitchfork_albums.html')
  albumsData = Nokogiri::HTML(albumsPath)
  @albums = albumsData.css('li')
  haml :index
end



