require 'open-uri'
require 'json'
require 'nokogiri'
<<<<<<< HEAD
require './blackListed.rb'
=======

>>>>>>> 9be78b52bc0d332771f28675004b049297bc60a2

#file = File.read "newdata.json"

data.each do |d|

	new_links = d['url']
	
	blackListed_links = [
		'http://wiki.d-addicts.com/index.php?title=Category:JActor&from=',
		'/index.php?title=Category:JActor&pagefrom=',
		'http://wiki.d-addicts.com/Category:JDrama',
		'http://wiki.d-addicts.com/index.php?title=Category',
		'http://wiki.d-addicts.com/index.php?',
		'http://wiki.d-addicts.com/index.php?title=',
		'http://wiki.d-addicts.com/File:'
	]

	puts BlackListed.getLinks(new_links, blackListed_links)

end

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
>>>>>>> 9be78b52bc0d332771f28675004b049297bc60a2
