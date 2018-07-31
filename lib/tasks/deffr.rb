require 'open-uri'
require 'json'


file = File.read "newdata.json"
data = JSON.parse(file)

puts data