require 'open-uri'
require 'json'

require 'mechanize'




begin 
  actors= []
  
file = File.read "newdata.json"
agent = Mechanize.new 


data = JSON.parse(file)    # breaks , only works for movies and actors urls , not for others
 data.each do |title|
   url =  title["url"]
    page =  agent.get(url)
      profile=  page.search('//*[@id="mw-content-text"]/h2[1]').text
      names = page.search('/html/body/div[3]/div[2]/div[6]/ul[1]/li[1]/b').text
   
  #end 
    puts page.class  
    puts url

 


     #if page.class != Mechanize::Page || page.class == Mechanize::Image 
    # puts "Image error will not stop me fool "
     #  next
      if page.class == Mechanize::Page &&   names == "Name:" && profile == "Profile" 
      person_name = URI(url).path.split('/').last  
      #else 
      #next 
       #end 

      
      if page.search('//*[@id="mw-content-text"]/h2[2]').text == "TV Shows" || page.search('//*[@id="mw-content-text"]/h2[2]').text == "TV Series" || page.search('//*[@id="mw-content-text"]/h2[2]').text == "TV Shows as an Actor"

  tv_shows = page.search('//*[@id="mw-content-text"]/ul[2]').text
  
  #puts tv_shows 
    
  

  else   page.search('//*[@id="mw-content-text"]/h2[2]').text == "Movies"||  page.search('//*[@id="mw-content-text"]/h2[2]').text == "Movies as an Actor"
        movies = page.search('//*[@id="mw-content-text"]/ul[2]').text
       # puts movies
 

    end 
     if page.search('//*[@id="mw-content-text"]/h2[3]').text == "TV Shows" || page.search('//*[@id="mw-content-text"]/h2[3]').text == "TV Series" || page.search('//*[@id="mw-content-text"]/h2[3]').text == "TV Shows as an Actor"

  tv_shows = page.search('//*[@id="mw-content-text"]/ul[3]').text
   # puts tv_shows
    

  else   page.search('//*[@id="mw-content-text"]/h2[3]').text == "Movies"||  page.search('//*[@id="mw-content-text"]/h2[3]').text == "Movies as an Actor"
        movies = page.search('//*[@id="mw-content-text"]/ul[3]').text
          #   puts movies 

        end 
     

is_movie = {
  "#{person_name}" => { 
    "profile" => "#{profile}",
    "movies" => "#{movies}",
    "tv_show" => "#{tv_shows}"
  }
  
   } 
       #puts is_movie
       actors.push(is_movie) 
        json = JSON.pretty_generate(is_movie)  
         puts is_movie
        
        File.open("actors_data.json","a") {|f|f.write(json) }

    else 
      next 
     end 

     

      rescue Mechanize::ResponseCodeError   => e 

    puts "404 error , won't stop me "
    next 

  rescue NoMethodError =>a
    puts "NoMethodError shall never stop me "
    next
      

  
end 
end 
#end 




  
    



