
require_relative "../lib/game"
require_relative "../lib/grid"
require_relative "../lib/player"

describe Game do
  
  subject(:game) { described_class.new(player, opponent, grid) }
  let(:player) { instance_double(Player) }
  let(:opponent) { instance_double(Player) }
  let(:grid) { instance_double(Grid) }
  

  describe "#swap_players" do
    context "when the players should be swapped" do

      it "should swap active players" do
        players = game.swap_players
        expect(players).to eql([opponent, player])
      end

      it "makes sure players actually swapped" do
        players = game.players
        swap = game.swap_players
        expect(players).to_not eql(swap)
      end

      it "should equal if swapped twice" do
        players = game.players
        swap = game.swap_players  
        unswap = game.swap_players
        expect(players).to eql(unswap)
      end
    end
  end

  describe "game_over?" do
    context "when there are four tokens next to eachother" do

      before do
        allow(game.grid).to receive(:get_connected_tokens).and_return(true)
      end

      it "should return true" do
        expect(game).to be_game_over
      end
    end

    context "when there is not four adjacent tokens" do

      before do
        allow(game.grid).to receive(:get_connected_tokens).and_return(false)
      end

      it "should be false" do
        expect(game).to_not be_game_over
      end
    end

    context "when the method is called" do

      before do
        allow(game.grid).to receive(:get_connected_tokens)
      end

      it "should send a message to get_connected_tokens method of grid" do
        expect(game.grid).to receive(:get_connected_tokens).once
        game.game_over?
        
      end
    end

  end

  

end