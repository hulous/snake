require "spec_helper"

RSpec.describe Snake::Food do
  subject(:food) { described_class.new }

  context "#draw" do
    subject(:snake_food_draw) { food.draw }

    context '.x' do
      it { expect(snake_food_draw.x).to be_between(0, 640).inclusive }
    end

    context '.y' do
      it { expect(snake_food_draw.y).to be_between(0, 480).inclusive }
    end

    context '.color' do
      it { expect(snake_food_draw.color).to be_instance_of(Ruby2D::Color) }

      it "is rgba yellow" do
        expect(snake_food_draw.color.r).to eql(1.0)
        expect(snake_food_draw.color.g).to eql(0.8627450980392157)
        expect(snake_food_draw.color.b).to eql(0.0)
        expect(snake_food_draw.color.a).to eql(1.0)
      end
    end
  end
  
  context ".eaten?" do
    subject(:snake_food_eaten) { food.eaten?(snake_head) }

    let(:food_x) { food.send(:x) }
    let(:food_y) { food.send(:y) }

    context '.true' do
      let(:snake_head) { [food_x, food_y} }

      it { expect(snake_food_eaten).to be(true) }
    end

    context '.false' do
      let(:snake_head) { [food_x / 2, food_y / 2] }

      it { expect(snake_food_eaten).to be(false) }
    end
  end
end
