require 'player'
require 'roll'
require 'turn'

class Game
	attr_accessor :no_of_players, :players

	def initialize(no_of_players)
		@players = []

		no_of_players.times do |i|
			@players << Player.new(i)
		end
	end

	def start()

		while(true)
			@players.each do |player|
				puts player.to_s
				turn = Turn.new(player)
				turn.start()

				player.in_the_game = true if (!player.in_the_game and turn.score >= 300)
				player.score += turn.score if player.in_the_game

				puts "Turn ended for #{player.to_s}"

				break if player.score >= 3000
			end
		end

		#final round

		#final scores
		players.each do |player|
			puts "Player #{player.id} final score is #{player.score}"
		end

		puts "Game ended."
	end

end

puts "Enter number of players for the new game:"
no_of_players = gets().chomp().to_i
Game.new(no_of_players).start()