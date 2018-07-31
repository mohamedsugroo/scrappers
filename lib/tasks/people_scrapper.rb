require 'open-uri'
require 'nokogiri'
require 'json'
require 'spidr'

url = 'http://wiki.d-addicts.com/Category:JActor'
html = open(url)
doc = Nokogiri::HTML(html)
people = []
blackList = [
	'http://wiki.d-addicts.com/index.php?title=Category:JActor&from=',
	'/index.php?title=Category:JActor&pagefrom=',
	'http://wiki.d-addicts.com/Category:JDrama',
	'http://wiki.d-addicts.com/index.php?title=Category'
]




Spidr.site('http://wiki.d-addicts.com/Main_Page') do |spidr|

	spidr.every_url do |url|
		if %w(blackList).include?(url)
		else
			puts url

			people.push(
				url: url
				)
			json = JSON.pretty_generate(people)
		end

		File.open("newdata.json", 'w') { |file| file.write(json) }
	end

end


# puts json





# rails g scaffold title type