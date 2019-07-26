require 'card'

class Deck
	RANKS = (7..10).to_a + [:jack, :queen, :king, :ace]
	SUITS = [:hearts, :spades, :clubs, :diamonds]

	def self.all
		SUITS.product(RANKS).map do |suit, rank|
			Card.build(suit,rank)
		end
	end
end