require 'rspec'
require 'tdd'

describe Array do
  describe "#my_uniq" do
    it "gets rid of dups in an array" do
      arr = [1, 2, 1, 3, 3]
      expect(arr.my_uniq). to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }
    let(:arr2) { [-1, 1, 1, -2, -3] }
    it "returns positions first position priority" do
      expect(arr.two_sum). to eq([[0, 4], [2, 3]])
    end
    it "returns positions first position the same so move to second" do
      expect(arr2.two_sum). to eq([[0, 1], [0, 2]])
    end
  end

  describe "#my_transpose" do
    let(:arr) {
      [
        [0, 1, 2],
        [3, 4, 5]
      ]
    }
    let(:cols) { arr.transpose }

    it "does NOT call the built in Array#transpose" do
      expect(arr).not_to receive(:transpose)
      arr.my_transpose {}
    end

    it "returns the correct columns" do
      expect(arr.my_transpose). to eq(cols)
    end
  end

  describe "#stock_pick" do
    let(:prices) { [2, 5, 1, 10, 0] }

    it "does find the most profitable pairs" do
      expect(prices.stock_pick).to eq([2, 3])
    end

  end
end
