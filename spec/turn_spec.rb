require 'spec_helper'

describe Turn do

	before(:each) do
		@player = Player.new(1)
	end
	
	describe "#start" do

		  it "scores 0 when a user eventually rolls non-scoring dices" do
		  	turn = Turn.new(@player)
		  	turn.stub(:gets).and_return("roll")
		  	turn.start

		  	expect(turn.score()).to eq(0)
		  end

		  it "returns valid score when a user ends the roll" do
		  	turn = Turn.new(@player)
		  	turn.stub(:gets).and_return("end")
		  	turn.start

		  	expect(turn.score()).to be > 0
		  end		  

	end

end