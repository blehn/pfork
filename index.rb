require 'sinatra'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'haml'

get '/' do
  tracksURL = "http://pitchfork.com/reviews/best/tracks/"
  tracksData = Nokogiri::HTML(open(tracksURL))
  @tracks = tracksData.css('#main .object-list li')

  albumsURL = "http://pitchfork.com/best/high-scoring-albums/"
  albumsData = Nokogiri::HTML(open(albumsURL))
  @albums = albumsData.css('.object-grid ul li')

  haml :index
end



