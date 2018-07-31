require 'spidr'
require 'nokogiri'
require'open-uri'
require 'watir'
require 'date'

@d = []

 Spidr.site('http://wiki.d-addicts.com') do |spider| 
		


	spider.every_html_page   do |page|
		
# if working insert data into databse 		 

		#puts page.url
		url  =page.url


		browser = Watir::Browser.new   :chrome, headless: true
		browser.goto url 
		     @name = browser.element(:xpath => " //*[@id='mw-content-text']/ul[1]/li[1]" ).text   # scrapper for people 
 @profession  = browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[5]").text
    if  page.title.include? "Profile "
 @profession  = browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[5]").text
 @birthdate  = browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[6]").text
 @birthplace  = browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[7]").text
 @height      = browser.element(:xpath => "//*[@id='mw-content-text']/ul[1]/li[8]").text
 @weight      = browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[9]").text
 @blood_type  = browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[10]").text
 @star_sign   =  browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[11]").text
 @talent_agency =browser.element(:xpath =>"//*[@id='mw-content-text']/ul[1]/li[12]").text  
 #puts @talent_agency
 #puts @star_sign
 #puts @blood_type
 #puts Date.today 
elsif page.title.include? "Synopsis"   
	 @title =  browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[1]").text
     @english_title =browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[2]").text
    @alias =browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[3]").text 
    @genre=browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[4]").text
    @episodes = browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[5]").text
    @broadcast_network=browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[6]").text
    @broadcast_peroid=browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[7]").text
    @air_time = browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[8]").text
    @related_tv_series = browser.element(:xpath =>  "//*[@id='mw-content-text']/ul[1]/li[9]").text
    @synopsis = browser.element (:xpath=>"//*[@id='mw-content-text']/p[3]").text
    @cast = []
      @cast << browser.element (:xpath=> "//*[@id='mw-content-text']/div[3]").text
       @cast<< browser.element (:xpath=> "//*[@id='mw-content-text']/div[4]").text   

else 

    # puts nill
        
     
# get all links , save into json file 
# seperate links ino 2  catoeroiges , arrays , people and title  , link and person namre , movies do same 
# what information do you want to gather for these specfic links 
# create black _list links, links contains information about website
# if these links are scraped, ifurl reads this links skip it move onto next link
# 2 arrays , people , title 
# json code , store link to the movie , link to person profile page and their name 
# store movies , 

        end
    end 
end 
 #puts @talent_agency
 #puts @star_sign
 #puts @blood_type
 puts Date.today 

 class People_Scrapper 
 

 def self.name()

 	"puts bame"

 end

 # do caluclaitons that i need to do 

 def self.age (birthdate)
 	age =  Date.today - @birthdate

 	puts age

 end 

 def self.profession
 	puts "profession"  # improtants differentaies korean , japanese + cheinses + other actors , allows me to categroize actors 
 end 

 def self.birthplace
 	puts "birthplace"
 end 

 def self.height 
 	puts "height"
 end 

 def self.weight
 	puts "weight"
 end 

 def self.star_sign
 	puts "star_sign"
 end 

 def self.blood_type
 	puts "blood_type"
 end 

 def self.talent_agency
 end 

 def self.tv_shows

 end 

 end 


class Movie_Scrapper

	def self.title 
		puts "title"
	end 

	def self.alias
		puts "alias"
	end

	def self.genre 
		puts "genre"
	end 
    
    def self.episodes
    	puts "episodes"
    end 

    def self.broadcast_network
    	puts "broadcast_network"
    end 

    def self.broadcast_peroid
    	puts "broadcast_peroid"
    end 

    def self.air_time 
    	puts "air_time "
    end 

 



   		

       

	 
