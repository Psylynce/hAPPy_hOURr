Given /I am on the Happy Hour Bars page/ do

end

Then /I should see a list of bars/ do 
	Bar.all.each do |bar|
		steps %Q(Then I should see "#{bar.name}")
	end
end


# Add a declarative step here for populating the DB with movies.

