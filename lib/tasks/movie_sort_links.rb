require 'open-uri'
require 'json'

require 'mechanize'


begin 
   
file = File.read "newdata.json"

data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
 	 url = title["url"]


agent = Mechanize.new 
begin 
   page =  agent.get(url)
   puts page.class 
   puts url 
    rescue Mechanize::ResponseCodeError => e 
 	 	puts "404 error , won't stop me "

   puts page.class 
   if page.class != Mechanize::Page
  
  next
   
end 
 	
 	 #	rescue NoMethodError => e

movie =  agent.page.title.to_s


         # trying to solve this error, rb:25:in `rescue in block in <main>': undefined method `title' for nil:NilClass (NoMethodError)

#rescue NameError => e

     # puts "Name error not stopping me "

      

if movie.include?  "Synopsis" 
     puts "this is a movie: " + movie 
      is_movie = {"movie_name" => "#{movie}"}
    json   = JSON.pretty_generate(is_movie)
end 
    File.open("movie_title.json","w") do |f|
    f.write(json)

end
 	# save this to a json file
 

    # put it to sleep for 1 to 9 seconds   
	

 end 

 
	
 	 

  end 

end 

