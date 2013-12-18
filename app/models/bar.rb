class Bar < ActiveRecord::Base
	validates :name, presence: true

	has_reputation :ratings, source: :user, aggregated_by: :average

	has_many :comments

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

	def convert_to_time(string)
    if string == "start"
    	time = self.start_time
    else
    	time = self.end_time
		end
    @string = time.to_s


    if @string.match(".0")
      @string.gsub(".0", ":00")
    else
      @string.gsub(".5", ":30" )
    end
  end
end