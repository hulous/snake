require "spec_helper"

RSpec.describe Snake::Player do
  subject(:player) { described_class.new }

  describe "#new" do
    it { expect(player.instance_variables.sort).to eq(%i[@lose @score]) }
    it { expect(player.instance_variable_get(:@score)).to eq(0) }
    it { expect(player.instance_variable_get(:@lose)).to eq(false) }
  end

  describe "#draw" do
    subject(:player_draw) { player.draw }

    context '.game runs' do
      it { expect(player_draw).to be_instance_of(Ruby2D::Text) }
      it { expect(player_draw.instance_variable_get(:@x)).to eq(10) }
      it { expect(player_draw.instance_variable_get(:@y)).to eq(10) }
      it { expect(player_draw.instance_variable_get(:@z)).to eq(0) }
      it { expect(player_draw.instance_variable_get(:@text)).to eq("Score: 0") }
      it { expect(player_draw.instance_variable_get(:@size)).to eq(25) }
    end
    
    context '.game over' do
      before { player.lose }

      it { expect(player_draw).to be_instance_of(Ruby2D::Text) }
      it { expect(player_draw.instance_variable_get(:@x)).to eq(10) }
      it { expect(player_draw.instance_variable_get(:@y)).to eq(10) }
      it { expect(player_draw.instance_variable_get(:@z)).to eq(0) }
      it { expect(player_draw.instance_variable_get(:@text)).to eq("Score: 0. Game Over! Press 'r' to restart. Press 'q' to quit.") }
      it { expect(player_draw.instance_variable_get(:@size)).to eq(25) }
    end
  end

  describe "#record_eat" do
    it 'increment scoring well' do
      expect(player.instance_variable_get(:@score)).to eq(0)

      player.record_eat
      expect(player.instance_variable_get(:@score)).to eq(1)

      player.record_eat
      expect(player.instance_variable_get(:@score)).to eq(2)
    end
  end
  
  describe "#lose?" do
    context ".true" do
      before { player.instance_variable_set(:@lose, true) }

      it { expect(player.lose?).to eq(true) }
    end
  
    context ".false" do
      before { player.instance_variable_set(:@lose, false) }

      it { expect(player.lose?).to eq(false) }
    end
  end

  describe "#lose" do
    it do
      expect(player.lose).to eq(true)
      expect(player.instance_variable_get(:@lose)).to eq(true)
    end
  end
end
