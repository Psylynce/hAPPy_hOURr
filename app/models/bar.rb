class Bar < ActiveRecord::Base
	def self.all_areas
		# ['Downtown', 'The Hill', 'South Boulder', 'North Boulder', 'East Boulder']
		%w(Downtown The\ Hill South\ Boulder North\ Boulder East\ Boulder)
	end
end
