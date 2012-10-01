require 'nokogiri'
require 'open-uri'

# Scrape Pitchfork and write to a file
task :scrape do
  File.open('pitchfork_albums.html','w') do |f|
    1.upto(3) do |page|
      pitchforkAlbumsURL = 'http://pitchfork.com/best/high-scoring-albums/' + page.to_s
      pitchforkAlbumsData = Nokogiri::HTML(open(pitchforkAlbumsURL).read, nil, 'utf-8')
      f.puts pitchforkAlbumsData.css('.object-grid ul li')
    end
  end
end



