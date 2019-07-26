require 'spec_helper'
require 'card.rb'
#require 'Set'



RSpec.describe "a playing card" do
	def card(params={})
	defaults={
		suit: :spades,
		rank: 7,
	}
	#Card.new(**defaults.merge(params))
	Card.build(*defaults.merge(params).values_at(:suit,  :rank))
end

	it "has a suit" do
		raise unless card(suit: :spades).suit == :spades
	end
	it "has a rank" do
		raise unless card(rank: :jack).rank == 11
	end

describe "Card" do
	def subject
		@subject ||= card(suit: :spades, rank: 4)
	end

	it "is equal to itself" do
		other = card(suit: :spades, rank: 4)
		#let(:other) { card(suit: :spades, rank: 4) }

		#raise unless subject == other
		expect(subject).to eq(other)
	end

	it "is not equal to a card of different suite" do
		#let(:other) { card(suit: :hearts, rank: 4) }
		other = card(suit: :hearts, rank: 4)
		
		#raise unless subject != other
		expect(subject).to_not eq(other)
	end

	it "is not equal to a card of different rank" do
		#let(:other) { card(suit: :spades, rank: 5) }
		other = card(suit: :spades, rank: 5)

		#raise unless subject != other
		expect(subject).to_not eq(other)
	end
end

	describe "a jack" do
		it "ranks higher than 10" do
			lower=card(rank: 10).rank
			higher=card(rank: :jack).rank
			raise unless higher > lower
		end
	end

	describe "a queen" do
		it "ranks higher than jack" do
			lower=card(rank: :jack).rank
			higher=card(rank: :queen).rank
			raise unless higher > lower
		end
	end

	describe "a king" do
		it "ranks higher than queen" do
			lower=card(rank: :queen).rank
			higher=card(rank: :king).rank
			raise unless higher > lower
		end
	end

	describe "shorthand representation" do
		it "of a Jack" do
			expect(Card.from_string("JC")).to eq(card(suit: "clubs", rank: "jack"))
		end

		it "of a King" do
			expect(Card.from_string("KS")).to eq(card(suit: "spades", rank: "king"))
		end

		it "of a Queen" do
			expect(Card.from_string("QH")).to eq(card(suit: "hearts", rank: "queen"))
		end

		it "of an Ace" do
			expect(Card.from_string("AD")).to eq(card(suit: "diamonds", rank: "ace"))
		end

		it "of a number" do
			expect(Card.from_string("5S")).to eq(card(suit: "spades", rank: 5))
		end
	end
end
