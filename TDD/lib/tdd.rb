
class Array

  def my_uniq
    arr = []
    self.each { |el| arr << el unless arr.include?(el) }
    arr
  end

  def two_sum
    pos = []
    (0...self.length).each do |x|
      (x+1...self.length).each do |y|
        pos << [x, y] if self[x] + self[y] == 0
      end
    end
    pos
  end

  def my_transpose
    arr = Array.new(self[0].length) { Array.new(self.length) }
    (0...self.length).each do |x|
      (0...self[x].length).each do |y|
        arr[y][x] = self[x][y]
      end
    end
    arr
  end

  def stock_pick
    arr = []
    biggest_diff = 0
    (0...self.length).each do |x|
      (x+1...self.length).each do |y|
        dif = self[y] - self[x]
        if dif > biggest_diff
          biggest_diff = dif
          arr = [x, y]
        end 
      end
    end
    arr
  end

end
