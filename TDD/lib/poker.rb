class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{suit}#{value}"
  end

end

class Deck
  attr_reader :cards

  def initialize
    @cards = populate_card
  end

  def populate_card
    arr = []
    (0..3).each do |i|
      case i
      when 0
        suit = "h"
      when 1
        suit = "d"
      when 2
        suit = "s"
      when 3
        suit = "c"
      end
      (1..13).each do |val|
        arr << Card.new(suit, val)
      end
    end
    arr
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end

end

=begin
    class Game
      def turn
        hand.add_card(deck.deal_card)
      end
=end

class Hand
  attr_reader :hand
  def initialize
    @hand = []
  end

  def add_card(card)
    @hand.push(card)
  end

  def discard_cards(*args)
    args.each do |card|
      @hand.delete(card)
    end
  end

  # def rank
  #   case @hand
  #   when #straight flush
  #     return 0
  #   when
  #     return 1
  #   when #straight flush
  #     return 0
  #   when #four of a kind
  #     return 1
  #   when #straight flush
  #     return 0
  #   when #four of a kind
  #     return 1
  #   else
  #     return nil
  #   end
  #
  # end

end


class Player
  def initialize(name, pot=500)
    @name = name
    @hand = Hand.new
    @pot = pot
  end

  def input(command)
    case command
      when "fold"
        return :pass
      when "discard"
        discard.each do |card|
          @hand.discard_card(card)
        end
        return discard.length
      when "see"
        @pot -= 10
      when "raise"
        amount = get.chomp.to_i
        @pot -= amount
        return amount
      end
    end

  def discard
    puts "Which cards would you like to discard? (Up to 3)"
    begin
      pos = gets.chomp.split("").map(&:to_i)
      if pos.length > 3
        raise "Too many cards."
      else
        return pos
      end
    rescue
      puts "Please try again."
      retry
    end
    pos
  end

end

class Game
  def initialize

  end

end
