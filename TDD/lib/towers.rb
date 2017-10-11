class Game
  attr_accessor :towers
  def initialize
    @towers = [[1, 2, 3], [], []]
  end
  def move(from, to)
    raise "Initial tower is empty" if @towers[from].empty?
    raise "Invalid move" unless @towers[to].empty? || @towers[from].first < @towers[to].first
    @towers[to].unshift(@towers[from].shift)
  end

  def won?

  end
end
