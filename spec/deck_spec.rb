require 'deck'

module ArrayMatchers
	extend RSpec::Matchers::DSL

#RSpec::Matchers.define(:be_contiguous) do
matcher :be_contiguous do
	match do |array|
		array
			.sort
			.each_cons(2)
			.all? {|x, y| x + 1 == y}
	end
end
end

describe "Deck"  do
	include ArrayMatchers
	describe "all" do
		it "contains 32 cards" do
			expect(Deck.all.length).to eq(32)
		end

		it "lowest card is 7" do
#			Deck::SUITS.each do |suit|
#				expect(Deck.all).to include(Card.build(suit,7))
#				expect(Deck.all).to_not include(Card.build(suit,6))
			expect(Deck.all.map {|card| card.rank}).to all(be >= 7)	
			end

		it "contiguous ranks in all suit" do
			Deck.all.group_by {|card| card.suit}.each do |suit,cards|
				expect(cards.map {|card| card.rank}).to be_contiguous(true)
			end
		end
	end
end

#end