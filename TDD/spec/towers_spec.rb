require 'rspec'
require 'towers'

describe Game do
  subject (:game) { Game.new }
  describe "#initialize" do
    it "initialize 2d array with tower in it" do
      expect(game.towers). to eq([[1, 2, 3], [], []])
    end
  end

  describe "#move" do

    before(:each) do
      game.move(0, 1)
    end

    it "moves to the correct tower" do
      expect(game.towers). to eq([[2, 3], [1], []])
    end

    it "raises error if tower is empty" do
      game.move(0, 1)
      expect { game.move }. to raise_error("Invalid move")
    end

    it "raises error if moves from empty tower" do
      game.move(2,1)
      expect { game.move }. to raise_error("Initial tower is empty")
    end
  end

  describe "#won?" do

    it "returns false when the game is not over" do
      expect(game.won?). to be false
    end

    it "returns true when the game is won" do
      game.towers = [[],[],[1,2,3]]
      expect(game.won?). to be true
      game.towers = [[],[1,2,3],[]]
      expect(game.won?). to be true
    end

  end
end
