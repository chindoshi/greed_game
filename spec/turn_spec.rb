require 'spec_helper'

describe Turn do

	before(:each) do
		@player = Player.new(1)
	end
	
	describe "#start" do

		  it "computes the total score" do
		  	turn = Turn.new(@player)
		  	#turn.start
		  	#expect { turn.score }.to raise_error(ArgumentError)
		  end

	end

end