require_relative "../lib/player"


describe Player do
  
  subject(:player) { described_class.new("Tanya", "black") }

  describe "#name" do
    context "when called" do
      it "returns the name attribute" do      
        name = player.name
        expect(name).to eq("Tanya")
      end
    end
  end

  describe "#color" do
    context "when called "do
      it "should return the player's color" do
        color = player.color  
        expect(color).to eq("black")
      end
    end
  end

  describe "#valid_input" do
    context "when input is valid" do
      it "should return true" do
        input = 5
        expect(player.valid_input(input)).to be true
      end
    end

    context "when input is invalid should return nil" do
      it "if input is a non number" do
        input = 'd'
        expect(player.valid_input(input)).to be_nil
      end

      it "if input is a non number" do
        input = '!'
        expect(player.valid_input(input)).to be_nil
      end

      it "if input is not between 1 and 7" do
        input = 19
        expect(player.valid_input(input)).to be_nil
      end

      it "if input is not between 1 and 7" do
        input = 11
        expect(player.valid_input(input)).to be_nil
      end
    end

  end

  describe "#get_move" do
    context "should send a message" do

      before do
        allow(player).to receive(:gets).and_return(2).once
        allow(player).to receive(:valid_input).and_return(true)
      end
      
      it "to valid_input once" do
        expect(player).to receive(:valid_input).once
        player.get_move
      end

    end
  end

      


end

