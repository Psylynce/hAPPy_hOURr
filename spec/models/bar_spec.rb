require 'spec_helper'

describe Bar do
  	it 'is not valid without a name' do
  		bar = Bar.new
  		bar.should_not be_valid
  	end
end
