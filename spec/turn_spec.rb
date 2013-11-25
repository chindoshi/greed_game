require 'spec_helper'

describe Turn do

	before(:each) do
		@player = Player.new(1)
	end
	
	describe "#start" do

		  it "scores 0 when a user eventually fails to roll any scoring dices" do
		  	turn = Turn.new(@player)
		  	turn.stub(:gets).and_return("roll")
		  	turn.start

		  	expect(turn.score()).to eq(0)
		  end

		  it "player is marked as in the game on scores above 300 for first time" do

		  	while(true)
		  		turn = Turn.new(@player)
		  		turn.stub(:gets).and_return("roll","end")
		  		turn.start
		  		if turn.score() >= 300
		  			break
		  		end
		  	end

		  	expect(turn.score()).to be >= 300		  	
		  	expect(@player.score()).to be >= 300
		  	expect(@player.in_the_game).to be_true
		  end	

		  it "updates the player's score" do
		  	
		  	@player.in_the_game = true
		  	old_score = @player.score
		  	
		  	while(true)
		  		turn = Turn.new(@player)
		  		turn.stub(:gets).and_return("end")
		  		turn.start
		  		if turn.score() >= 0
		  			break
		  		end

		  		expect(@player.score).to be > old_score
		  	end
		  end	  

	end

end