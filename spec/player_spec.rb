require 'spec_helper'

describe Player do
	
	describe "#new" do

		context "with no parameters" do	
			  it "needs one argument to initialize" do
			  	expect { Player.new }.to raise_error(ArgumentError)
			  end
		end

		context "with valid parameters" do
			it "simulates the roll" do
				player1 = Player.new(2)

				expect(player1.score).to eq(0)
				expect(player1.in_the_game).to be_false
			end
		end

	end

end