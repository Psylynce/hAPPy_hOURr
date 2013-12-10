class Bar < ActiveRecord::Base
	def self.all_areas
		%w(Downtown The\ Hill South North East)
	end
end
