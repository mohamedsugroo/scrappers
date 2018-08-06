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
      profile=  page.search('//*[@id="mw-content-text"]/h2[1]').text
      name = page.search('/html/body/div[3]/div[2]/div[6]/ul[1]/li[1]/b').text
   
  #end 
    puts page.class  
    puts url

 


     #if page.class != Mechanize::Page || page.class == Mechanize::Image 
    # puts "Image error will not stop me fool "
     #  next
      if page.class == Mechanize::Page &&   name == "Name:" && profile == "Profile"
      person_name = URI(url).path.split('/').last 
      is_movie ={"person_name" => "#{person_name}"}
       #puts is_movie
       movies.push(is_movie) 
        json = JSON.pretty_generate(movies)  
         puts movies 
        
        File.open("movie_title.json","w") {|f|f.write(json) }

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

     


  
    



