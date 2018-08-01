require 'open-uri'
require 'json'
require 'nokogiri'




data = JSON.parse(file)   
 data.each do |title|
 	 url = title["url"]
 	
 	doc =Nokogiri::HTML(open(url))
 
 	  if doc.xpath('//*[@id="Profile"]') 
	     puts "this is a person "
         @name = doc.xpath('//*[@id="mw-content-text"]/ul[1]/li[2]/text()').text
     json = JSON.pretty_generate(@people) 
      File.open("name.json","w") do |f|
  f.write(json)
	  end       

	

           
          end

    # put it to sleep for 1 to 9 seconds   
	

 #end 
