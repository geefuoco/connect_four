
require_relative "../lib/grid"
require_relative "../lib/messanger"
require_relative "../lib/cell"

describe Grid do

  subject(:grid)  { Grid.new }


  context "when the grid is created" do
    it "should make 42 cells" do

      
      cells = grid.cells
      expect(cells.length).to eq(42)


    end
  end


  describe "#update_display" do
    context "after a move has been played" do

      subject(:grid) { Grid.new(messanger) }
      let(:messanger) { instance_double(Messanger, display_grid: 0 )}

      it "should let messanger know to reprint board" do
        expect(messanger).to receive(:display_grid).once
        grid.update_display

      end
    end
  end


  describe "#place_token" do
    context "when trying to place a token " do

      let(:cell) { grid.cells[0] }

      it "should place the token" do
        expect(cell).to receive(:update_cell).once
        grid.place_token(1, 1, "white")
      end

      it "should raise an error if the position doesnt exist" do
        expect { grid.place_token(0, 0, "white") }.to raise_error(NoMethodError)
      end


    end
  end

  describe "#get_connected_tokens" do

    context "when there are 4 horizontal tokens" do
      
      before do
        grid.place_token(1, 1, "white")
        grid.place_token(2, 1, "white")
        grid.place_token(3, 1, "white")
        grid.place_token(4, 1, "white")
      end

      it "returns true" do

        expect(grid.get_connected_tokens).to be true
      end
    end

    context "when there is not 4 connected tokens" do
      it "returns falsey value" do
        expect(grid.get_connected_tokens).to be_falsey
      end
    end

  end
        


end