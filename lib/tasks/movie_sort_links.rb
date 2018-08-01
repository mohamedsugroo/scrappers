require 'open-uri'
require 'json'
#require 'nokogiri'
require 'mechanize'

begin 
 	rescue  Net::HTTPInternalError      
  puts "An error occurred"

rescue ResponseCodeError               # stoping code from crashing due to these errors 
  puts "ResponseCodeError occurred"

           
     end
file = File.read "newdata.json"

data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
 url = title["url"]
 	agent = Mechanize.new 
 	page =  agent.get(url)
 	
 	 # This fetches the page given as parameter

movie =  agent.page.title.to_s
if movie ==  'Synopsis' 
     puts "this is a movie: " + movie 
      is_movie = {"movie_name" => "#{movie}"}
    json   = JSON.pretty_generate(is_movie)
    File.open("movie_title.json","w") do |f|
    f.write(json)

end 
 	 	
# doc =Nokogiri::HTML(open(url))
#url = title["url"]
 	#  puts @english_title =doc.xpath('//*[@id="mw-content-text"]/ul[1]/li[2]').text
 	 
 #if doc.xpath('//*[@id="Synopsis"]')
 
 #	puts  "this is a movie"
 #	 @english_title =doc.xpath('//*[@id="mw-content-text"]/ul[1]/li[2]').text
 #json = JSON.pretty_generate(@english_title)
  #File.open("movie_title.json.","w") do |f|
  #f.write(json)
end
 	# save this to a json file
 

    # put it to sleep for 1 to 9 seconds   
	

 end 

#end