require 'open-uri'
require 'json'
#require 'nokogiri'
require 'mechanize'



   
file = File.read "newdata.json"

data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
 	 url = title["url"]


agent = Mechanize.new 
begin 


 	
 	page =  agent.get(url)

 	 rescue Mechanize::ResponseCodeError => e 
 	 	puts "404 error , won't stop me "
    # redirect_url = 
 	 #next

 	else 
 	 # This fetches the page given as parameter

movie =  agent.page.title.to_s

 	

if movie ==  'Synopsis' 
     puts "this is a movie: " + movie 
      is_movie = {"movie_name" => "#{movie}"}
    json   = JSON.pretty_generate(is_movie)
    File.open("movie_title.json","w") do |f|
    f.write(json)

    #rescue Exception => e 
    #	 puts "I will not be stopped"
   # rescue  Net::HTTPInternalError      
  #puts "An error occurred"

#rescue Mechanize.ResponseCodeError               # trying to handel 404 error, but 404 error is still occuring .
 # puts "ResponseCodeError occurred"

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

end 