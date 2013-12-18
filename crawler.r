require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://www.happyhourboulder.com/restaurants.php?cat=8"
hashArray = []

page = Nokogiri::HTML(open(PAGE_URL))
puts page.css('title').text
barName = page.css('td[width="690"] strong')
barName.each{|name| puts name.text}
puts "Bar Name Count: " + barName.count.to_s()

barDetails =  page.css('div[align=justify]')
# barDetails.each{|d| puts d.text + "\nArea: 0\n\n"}
# # puts page.css('table.termsunderline_ tbody tr td').text
# puts "Bar Details Count: " + barDetails.count.to_s()
# happyHourArray = Array.new
# barDetails.each{|h| happyHourArray << h.text.match("^Happy hour: .*") }
# # puts happyHourArray
# puts "Happy Hours Count: " + happyHourArray.count.to_s()

# locationArray = Array.new
# barDetails.each{|l| locationArray << l.text.match("^Location: .*")}
# # puts locationArray
# puts "Locations Count: " + locationArray.count.to_s()

# phonebook = Array.new
# barDetails.each{|n| phonebook << n.text.match("^Phone: .*")}
# # puts phonebook
# puts "Phone Numbers Count: " + phonebook.count.to_s()

# drinkPrices = Array.new
# barDetails.each{|d| drinkPrices << d.text.match("^Drink specials: .*")}
# # puts drinkPrices
# puts "Drinks Count: " + drinkPrices.count.to_s()

# foodPrices = Array.new
# barDetails.each{|f| foodPrices << f.text.match("^Food specials: .*")}
# # puts foodPrices
# puts "Food Count: " + foodPrices.count.to_s()

# Get the actual happy hour times
# barDetails.each{|time| puts time.text.match("H")}
# barDetails.each{|time| puts time.text.match("((\d|\d:\d\d)-(\d|\d:\d\d)pm)")}
# (((\d|\d:\d\d)|((\d|\d:\d\d)\w+))(-|.|)(\d|\d:\d\d))|(all day|\d(\w+| | \w+)-close|\d\w+-midnight)
# puts happyHourArray
# barDetails.each{|x| 
# 	puts x.text
# 	matchesArray = x.text.scan(/((\d:\d\d)|\d(pm|am)|noon|Noon)+(-)((\d:\d\d)|\d(pm|am)|close|midnight)+/x)
# 	p matchesArray
# }


barName.each{ |name| 
	hashArray << {:name => name.text, :area => "East", :contact => "", :start_time => 0, :end_time => 0, :rating => 0}
}
p hashArray
File.write('output.txt', hashArray)