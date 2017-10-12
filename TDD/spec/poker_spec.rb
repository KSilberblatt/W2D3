require 'rspec'
require 'poker'

describe Card do
  subject (:my_card) { Card.new("d", 13) }

  describe "#initialize" do
    it "gives card a suit " do
      expect(my_card.suit).to eq("d")
    end

    it "gives card value" do
      expect(my_card.value).to eq(13)
    end
  end

end

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    let(:card) { double("d13") }

    it "checks whether there are 52 cards being populated" do
      expect(deck.cards.length).to eq(52)
    end

    it "checks whether each card is an object of Card class" do
      arr = deck.cards.map {|card| [card.suit, card.value] }
      expect(arr).to eq(arr.uniq)
    end

    it "shuffles the cards" do
      original_cards = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(original_cards)
    end

  end
end

describe Hand do
  subject(:hand) { Hand.new }

  describe "#initialize" do
    it "checks if hand is empty" do
      expect(hand.hand). to be_empty
    end
  end

  describe "#add_card" do
    let(:card) { double("card", :suit => "d", :value => 13) }

    it "checks if card was added" do
      hand.add_card(card)
      expect(hand.hand).to include(card)
    end
  end

end

describe Player do

end

describe Game do

end
