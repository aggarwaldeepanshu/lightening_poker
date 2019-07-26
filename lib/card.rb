class Card
	def self.build(suit,rank)
		new(suit:  suit, rank: rank)
	end
	private_class_method :new

	def initialize(suit:, rank:)
		@suit = suit
		@rank = case rank
		when :jack then 11
		when :queen then 12
		when :king then 13
		when :ace then 14
		else rank
		end
	end


	def inspect
		to_s
	end

	def suit
		@suit
	end

	def rank
		@rank
	end

	def ==(other)
		rank == other.rank && suit == other.suit
	end


	def self.from_string(value)
		var_suit = value[-1]

		suit_hash = {
			"H" => "hearts",
			"S" => "spades",
			"D" => "diamonds",
			"C" => "clubs"
		}.fetch(var_suit)

		rank_hash = {
			"J" => "jack",
			"K" => "king",
			"Q" => "queen",
			"A" => "ace",
			"5" => 5
		}.fetch(value[0])

		Card.build(suit_hash, rank_hash)
	end
end
