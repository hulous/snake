require "spec_helper"
require "byebug"

RSpec.describe Snake::Game do
  subject(:game_init) { described_class.new }

  describe "#new" do
    it { expect(game_init).to be_instance_of(Snake::Game)  }
  end

  describe "#run" do
    it do
      expect(Ruby2D::Window).to receive(:update) do |&block|
        expect(Ruby2D::Window).to receive(:clear)

        expect(block.yield).to be_nil
      end

      expect(Ruby2D::Window).to receive(:on) do |&block| 
        res = block.yield rescue nil

        expect(res).to be_nil
      end

      expect(Ruby2D::Window).to receive(:show).and_return(true)

      game_init.run
    end
  end
end


