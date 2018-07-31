require 'open-uri'
require 'json'
require 'nokogiri'


#file = File.read "newdata.json"

#data = JSON.parse(file)
 #data.each do |title|
 #	 url = title["url"]
 	doc = Nokogiri::HTML(open('http://wiki.d-addicts.com/33_Gu_Shi_Guan' ))
 	#puts doc 

 # puts doc.css('title').text

 
if doc.xpath('//*[@id="Synopsis"]') == true 
 #if  doc.css('title').text.include? "Profile"	
 	puts  "this is a movie" + title

#elsif   doc.title.include? "Synopsis"

 #     puts "this is a movie" + title

      else 
           puts nil

           
          end

    # put it to sleep for 1 to 9 seconds   
	

 #end 
