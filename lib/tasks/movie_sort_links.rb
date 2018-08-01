require 'open-uri'
require 'json'
require 'nokogiri'


file = File.read "newdata.json"

data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
 	url = title["url"]
 	#puts url 
 	#doc = Nokogiri::HTML(open('http://wiki.d-addicts.com/33_Gu_Shi_Guan' ))
 	
 doc =Nokogiri::HTML(open(url))

 	#  puts @english_title =doc.xpath('//*[@id="mw-content-text"]/ul[1]/li[2]').text
 	 
 if doc.xpath('//*[@id="Synopsis"]')
 
 	puts  "this is a movie"
 	 @english_title =doc.xpath('//*[@id="mw-content-text"]/ul[1]/li[2]').text
 json = JSON.pretty_generate(@english_title)
  File.open("movie_title.json","w") do |f|
  f.write(json)
end
 	# save this to a json file
           
     end

    # put it to sleep for 1 to 9 seconds   
	

 end 
