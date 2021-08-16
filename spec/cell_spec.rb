require_relative "../lib/cell.rb"

describe Cell do 

  describe "#position" do
    context "when called" do
      it "returns the position"do

        position = Cell.new(0, 0).position
        expect(position).to eq([0, 0])

      end
    end
  end


  describe "#update_cell" do
    context "when the cell gets a token placed in it" do

      subject(:cell) { described_class.new(0, 0)}

      it "should keep track of that tokens color" do

        cell.update_cell("white")
        expect(cell.color).to eq("white")

      end

      it "should not update if there is a color already" do
        cell.update_cell("black")
        cell.update_cell("white")
        expect(cell.color).to eq("black")
      end

      it "should raise an error if arugment is not white or black" do
        expect{ cell.update_cell("purple") }.to raise_error(ArgumentError)
      end
    end
  end






end