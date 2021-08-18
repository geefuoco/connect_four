
require_relative "../lib/grid"

describe Grid do

  subject(:grid)  { Grid.new }

  describe "#column" do
    context "when called " do

      subject(:grid) { Grid.new }

      before do
        grid.place_token(0, 3)
        grid.place_token(0, 3)
        grid.place_token(0, 3)
      end

      it "should return array of columns in the board" do
        expect(grid.column(0)).to be_a_kind_of(Array)
      end

      it "returns the first column" do
        col = grid.column(0)
        expect(col).to eq([0, 0, 0, 3, 3, 3])
      end
    end
  end

  describe "#full?" do
    context "when the board is new" do
      it "should return false" do
        expect(grid.full?(0)).to be false
      end
    end

    context "when the board has no room" do

      subject(:grid) { Grid.new }

      before do
        grid.place_token(4, 1)
        grid.place_token(4, 1)
        grid.place_token(4, "1")
        grid.place_token(4, 1)
        grid.place_token(4, 1)
        grid.place_token(4, 1)
      end

      it "should return true" do
        value = grid.full?(4)
        expect(value).to be true
      end
    end
        

  end


  describe "#place_token" do
    context "when a token is placed in column 4 in a new grid" do

      before do
        grid.place_token(4, "X")
      end

     it "should change the zero to an X" do
        expect(grid.board[5][4]).to eq("X")
      end
    end

    context "when a token is placed out of bounds" do
      it "should raise an error" do
        expect{ grid.place_token(9,"T") }.to raise_error(ArgumentError)
      end
    end
  end 

  describe "#four_in_row?" do
    context "when there are four mathcing symbols adjacent eachother" do

      subject(:win) { Grid.new }

      before do
        win.place_token(1, "X")
        win.place_token(2, "X")
        win.place_token(3, "X")
        win.place_token(4, "X")
      end


      it "should return true" do
        expect(win).to be_four_in_row
      end
    end

    context "when there is no win " do
      it "should return false" do
        expect(grid).to_not be_four_in_row
      end
    end

    context "when its not on the first row" do

      subject(:second) { Grid.new }

      before do
        second.place_token(1, 2)
        second.place_token(2, 3)
        second.place_token(3, 2)
        second.place_token(4, 3)
        second.place_token(1, 4)
        second.place_token(2, 4)
        second.place_token(3, 4)
        second.place_token(4, 4)
      end

      it "should still return true" do
        expect(second).to be_four_in_row
      end
    end

  end


  describe "#four_in_column?" do
    context "when there is four matching in a column" do

      subject(:column) { Grid.new }

      before do
        column.place_token(1, 2)
        column.place_token(1, 2)
        column.place_token(1, 2)
        column.place_token(1, 2)
      end

      it "should return true" do
        expect(column).to be_four_in_column 
      end
    end

    context "when there is not four in a column" do
      subject(:midgame) { Grid.new }

      before do
        midgame.place_token(1, 5)
        midgame.place_token(1, 5)
      end

      it "returns false" do
        expect(midgame).to_not be_four_in_column
      end

    end
  end

  describe "#four_in_diagnol?" do
    context  "when there is four mathcing in a diagnol" do

      subject(:diagnol) { Grid.new }

      before do
        diagnol.place_token(1, 2)
        diagnol.place_token(2, 5)
        diagnol.place_token(3, 2)
        diagnol.place_token(4, 5)

        diagnol.place_token(1, 2)
        diagnol.place_token(2, 5)
        diagnol.place_token(3, 5)
        diagnol.place_token(4, 5)

        diagnol.place_token(1, 7)
        diagnol.place_token(2, 5)
        diagnol.place_token(3, 8)
        diagnol.place_token(4, 9)

        diagnol.place_token(1, 5)
        # 5 1 1 1
        # 7 5 8 9
        # 2 5 5 5
        # 2 5 2 5
      end

      it "returns true" do
        expect(diagnol).to be_four_in_diagnol
      end
    end

    context "when there is not four matching diagnolly"do

      subject(:non_diagnol) { Grid.new }

      before do
        non_diagnol.place_token(1, 2)
        non_diagnol.place_token(2, 5)
        non_diagnol.place_token(3, 2)
        non_diagnol.place_token(4, 5)
        non_diagnol.place_token(1, 2)
        non_diagnol.place_token(2, 5)
        non_diagnol.place_token(3, 5)
        non_diagnol.place_token(4, 5)
        non_diagnol.place_token(1, 7)
        non_diagnol.place_token(2, 1)
        non_diagnol.place_token(3, 8)
        non_diagnol.place_token(4, 9)
        non_diagnol.place_token(1, 5)
        # 5 1 1 1
        # 7 1 8 9
        # 2 5 5 5
        # 2 5 2 5
      end


      it "should return false"do
        expect(non_diagnol).to_not be_four_in_diagnol
      end

    end

    context "when the diagnol is the other way" do

      subject(:other_diagnol) { Grid.new }

      before do
        other_diagnol.place_token(1, 1)
        other_diagnol.place_token(2, 2)
        other_diagnol.place_token(3, 3)
        other_diagnol.place_token(4, 4)

        other_diagnol.place_token(1, 2)
        other_diagnol.place_token(2, 1)
        other_diagnol.place_token(3, 4)
        other_diagnol.place_token(4, 5)

        other_diagnol.place_token(1, 2)
        other_diagnol.place_token(2, 3)
        other_diagnol.place_token(3, 1)
        other_diagnol.place_token(4, 1)

        other_diagnol.place_token(1, 2)
        other_diagnol.place_token(2, 3)
        other_diagnol.place_token(3, 1)
        other_diagnol.place_token(4, 1)
        
        # 2 3 1 1
        # 2 3 1 1
        # 2 1 4 5
        # 1 2 3 4
      end

      it "should return true" do
        expect(other_diagnol).to be_four_in_diagnol
      end
    end

  end
end