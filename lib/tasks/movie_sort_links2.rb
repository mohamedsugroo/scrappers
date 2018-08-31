require 'open-uri'
require 'json'

require 'mechanize'




begin 
  movies = []
  
file = File.read "newdata.json"
agent = Mechanize.new 


data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
 	 url =  title["url"]
    page =  agent.get(url)
      #details =  page.search('//*[@id="mw-content-text"]/h2[1]').text
      #episodes = page.search('//*[@id="mw-content-text"]/ul[1]/li[4]/b').text 
      title1 = page.search('//*[@id="mw-content-text"]/h2[1]').text
       title2 = page.search('//*[@id="mw-content-text"]/h2[2]').text 
   
 	#end 
    puts page.class  
    puts url

 


     #if page.class != Mechanize::Page || page.class == Mechanize::Image 
    #	puts "Image error will not stop me fool "
     # 	next
      if page.class == Mechanize::Page &&  title1 == "Details"  && title2 == "Synopsis"


      title = URI(url).path.split('/').last 
         details            =  page.search('//*[@id="mw-content-text"]/ul[1]').text
       synopsis           = page.search('//*[@id="mw-content-text"]/ul[2]').text
       cast               = page.search('//*[@id="mw-content-text"]/ul[3]').text
       production_credits = page.search('//*[@id="mw-content-text"]/ul[4]').text

is_movie = {
  "#{title}" => { 
    "details" => "#{details}",
    "synopsis" => "#{synopsis}",
    "cast " => "#{cast }",
    "production_credits " => "#{production_credits }"
  }
  
   } 
       movies.push(is_movie) 
        json = JSON.pretty_generate(movies)  
         puts movies 
        
        File.open("movie_title_data.json","w") {|f|f.write(json) }
#rescue 
    #elsif  page.class == Mechanize::Image || movie == nil 
    	 #puts "image will not stop me"

           #next   	
      	
    else 
    	next 
    	# make a method to handel the errors , and put that in ruby 
    	 end 
      # File.open("movie_title.json","w") {|f|f.write(json) }

    	rescue Mechanize::ResponseCodeError   => e 

 	 	puts "404 error , won't stop me "
 	 	next 

 	rescue NoMethodError =>a
 		puts "NoMethodError shall never stop me "
 		next
      
    
   
   
      
  
      #end
  #end 
     #else 
     #	 puts "this nill page error will NEVER STOP ME !!!"
    #next 
 
 


    


  #else movie.include? "Synopsis" and  page.class == Mechanize::Page 
  	 #	puts "this is a movie " + movie
   	#is_movie = {"movie_name " => "#{movie}"}
   # json = JSON.pretty_generate(is_movie)   	
    # File.open("movie_title.json","w") do |f|
    #f.write(json)

 	
end 

end 

 	 	 


  
 	 	



         # trying to solve this error, rb:25:in `rescue in block in <main>': undefined method `title' for nil:NilClass (NoMethodError)

#rescue NameError => e

     # puts "Name error not stopping me "

      

#if movie.include?  "Synopsis" 
    # puts "this is a movie: " + movie 
      #is_movie = {"movie_name" => "#{movie}"}
   # json   = JSON.pretty_generate(is_movie)
#end 
    #File.open("movie_title.json","w") do |f|
    #f.write(json)

#end
 	# save this to a json file
 

    # put it to sleep for 1 to 9 seconds   
	

 #end 
