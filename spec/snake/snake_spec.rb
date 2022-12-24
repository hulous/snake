require "spec_helper"

RSpec.describe Snake::Snake do
  subject(:snake) { described_class.new }

  describe "#new" do
    it { expect(snake.instance_variables.sort).to eq(%i[@direction @positions]) }
    it { expect(snake.instance_variable_get(:@direction)).to eq('down') }
    it { expect(snake.instance_variable_get(:@positions)).to eq([ [2, 0], [2, 1], [2, 2], [2, 3] ]) }
  end

  describe "#draw" do
    context 'draw 2 square' do
      before { snake.instance_variable_set(:@positions, [ [2, 0], [2, 1] ]) }

      it do
        expect(Ruby2D::Square).to receive(:new).twice.and_call_original

        snake.draw
      end
    end
  end

  describe "#move" do
    subject(:snake_move) { snake.move }
    subject(:snake_move_after_eat) { snake.move(after_eat: true) }

    context 'when before move' do
      it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 0], [2, 1], [2, 2], [2, 3]]) }
    end

    context 'when direction is "up"' do
      before { snake.instance_variable_set(:@direction, 'up') }

      context 'move' do
        before { snake_move }
      
        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 1], [2, 2], [2, 3], [2, 2]]) }
      end


      context 'move after eat' do
        before { snake_move_after_eat }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 0], [2, 1], [2, 2], [2, 3], [2, 2]]) }
      end
    end

    context 'when direction is "down"' do
      before { snake.instance_variable_set(:@direction, 'down') }

      context 'move' do
        before { snake_move }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 1], [2, 2], [2, 3], [2, 4]]) }
      end

      context 'move after eat' do
        before { snake_move_after_eat }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 0], [2, 1], [2, 2], [2, 3], [2, 4]]) }
      end
    end

    context 'when direction is "left"' do
      before { snake.instance_variable_set(:@direction, 'left') }

      context 'move' do
        before { snake_move }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 1], [2, 2], [2, 3], [1, 3]]) }
      end

      context 'move after eat' do
        before { snake_move_after_eat }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 0], [2, 1], [2, 2], [2, 3], [1, 3]]) }
      end
    end

    context 'when direction is "right"' do
      before { snake.instance_variable_set(:@direction, 'right') }

      context 'move' do
        before { snake_move }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 1], [2, 2], [2, 3], [3, 3]]) }
      end

      context 'nove after eat' do
        before { snake_move_after_eat }

        it { expect(snake.instance_variable_get(:@positions)).to eq([[2, 0], [2, 1], [2, 2], [2, 3], [3, 3]]) }
      end
    end
  end

  describe "#can_change_direction_to?" do
    context 'when direction is "up"' do
      before { snake.instance_variable_set(:@direction, 'up') }

      it { expect(snake.can_change_direction_to?('up')).to be(true) }
      it { expect(snake.can_change_direction_to?('down')).to be(false) }
      it { expect(snake.can_change_direction_to?('left')).to be(true) }
      it { expect(snake.can_change_direction_to?('right')).to be(true) }
    end

    context 'when direction is "down"' do
      before { snake.instance_variable_set(:@direction, 'down') }

      it { expect(snake.can_change_direction_to?('up')).to be(false) }
      it { expect(snake.can_change_direction_to?('down')).to be(true) }
      it { expect(snake.can_change_direction_to?('left')).to be(true) }
      it { expect(snake.can_change_direction_to?('right')).to be(true) }
    end

    context 'when direction is "left"' do
      before { snake.instance_variable_set(:@direction, 'left') }

      it { expect(snake.can_change_direction_to?('up')).to be(true) }
      it { expect(snake.can_change_direction_to?('down')).to be(true) }
      it { expect(snake.can_change_direction_to?('left')).to be(true) }
      it { expect(snake.can_change_direction_to?('right')).to be(false) }
    end

    context 'when direction is "right"' do
      before { snake.instance_variable_set(:@direction, 'right') }

      it { expect(snake.can_change_direction_to?('up')).to be(true) }
      it { expect(snake.can_change_direction_to?('down')).to be(true) }
      it { expect(snake.can_change_direction_to?('left')).to be(false) }
      it { expect(snake.can_change_direction_to?('right')).to be(true) }
    end
  end

  describe "#hit_itself?" do
    subject(:snake) { described_class.new }

    it { expect(snake.hit_itself?).to eq(false) }
  end
end
