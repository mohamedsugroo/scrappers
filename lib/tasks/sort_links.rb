require 'open-uri'
require 'json'
require 'nokogiri'
require './blackListed.rb'

file = File.read "newdata.json"
data = JSON.parse(file)

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
