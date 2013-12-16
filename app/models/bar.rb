class Bar < ActiveRecord::Base
	validates :name, presence: true

	has_reputation :rating, source: :user, aggregated_by: :average

	#def initialize(attributes = nil)
	#	super(attributes)
	#end
	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

	def self.all_areas
		%w(Downtown The\ Hill South North East)
	end
end
