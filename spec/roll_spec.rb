require 'spec_helper'

describe Roll do

	before(:each) do
		@roll1 = Roll.new(5, :override_outcome => [1,1,1,4,1])
		@roll2 = Roll.new(5, :override_outcome  => [2,3,4,1,5])
		@roll3 = Roll.new(5, :override_outcome  => [5,5,1,1,3])
		@roll4 = Roll.new(4, :override_outcome => [2,2,2,1])
		@roll5 = Roll.new(3, :override_outcome => [2,3,4])
		@roll6 = Roll.new(2, :override_outcome => [1,4])
		@roll7 = Roll.new(1, :override_outcome => [5])
	end
	
	describe "#new" do

		context "with no parameters" do	
			  it "needs one argument to initialize" do
			  	expect { Roll.new }.to raise_error(ArgumentError)
			  end
		end

		context "with valid parameters" do
			it "simulates the roll" do
				roll1 = Roll.new(4)
				roll2 = Roll.new(4, :override_outcome => [5,3,5,5])

				expect(roll1.outcome()).to be_a_kind_of(Array)
				expect(roll1.non_scoring_dices()).to be_a_kind_of(Array)
				expect(roll1.score()).to be_a_kind_of(Numeric)

				expect(roll2.outcome()).to be_a_kind_of(Array)
				expect(roll2.non_scoring_dices()).to be_a_kind_of(Array)
				expect(roll2.score()).to be_a_kind_of(Numeric)
			end

			it "calculates right score" do
				expect(@roll1.score).to eq(1100)
				expect(@roll2.score).to eq(150)
				expect(@roll3.score).to eq(300)
				expect(@roll4.score).to eq(300)
				expect(@roll5.score).to eq(0)
				expect(@roll6.score).to eq(100)
				expect(@roll7.score).to eq(50)	
			end

			it "returns right non-scoring dices" do
				expect(@roll1.non_scoring_dices).to eq([4])
				expect(@roll2.non_scoring_dices).to eq([2,3,4])
				expect(@roll3.non_scoring_dices).to eq([3])
				expect(@roll4.non_scoring_dices).to eq([])
				expect(@roll5.non_scoring_dices).to eq([2,3,4])
				expect(@roll6.non_scoring_dices).to eq([4])
				expect(@roll7.non_scoring_dices).to eq([])
			end
		end

	end

end
 