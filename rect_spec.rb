require_relative 'rect.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

describe Rectangle do
  context 'General testing' do
    let(:border_caracter) { '-' }
    let(:middle_caracter) { ' ' }
    let(:reverse_last_angles) { false }

    context 'when angle caracters are the same' do
      let(:left_angle_caracter) { 'o' }
      let(:right_angle_caracter) { 'o' }

      context 'single array' do
        let(:x) { 1 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns the left border only' do
          expect(@subject.make_payload).to eq([left_angle_caracter])
        end
      end
      context 'single line' do
        let(:x) { 3 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns a single line' do
          expect(@subject.make_payload).to eq(["#{left_angle_caracter}#{border_caracter}#{right_angle_caracter}"])
        end
      end
      context 'single column' do
        let(:x) { 1 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns 3 lines' do
          expect(@subject.make_payload).to eq([left_angle_caracter, border_caracter, left_angle_caracter])
        end
      end
      context 'square matrix' do
        let(:x) { 3 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns consistant midle line' do
          expect(@subject.make_payload[1]).to eq("#{border_caracter}#{middle_caracter}#{border_caracter}")
        end
      end
    end

    context 'when angle caracters are not the same' do
      let(:left_angle_caracter) { 'A' }
      let(:right_angle_caracter) { 'B' }

      context 'single array' do
        let(:x) { 1 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns the left border only' do
          expect(@subject.make_payload).to eq([left_angle_caracter])
        end
      end
      context 'single line' do
        let(:x) { 3 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns a single line' do
          expect(@subject.make_payload).to eq(["#{left_angle_caracter}#{border_caracter}#{right_angle_caracter}"])
        end
      end
      context 'single column' do
        let(:x) { 1 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns 3 lines' do
          expect(@subject.make_payload).to eq([left_angle_caracter, border_caracter, left_angle_caracter])
        end
      end
      context 'square matrix' do
        let(:x) { 3 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns consistant midle line' do
          expect(@subject.make_payload[1]).to eq("#{border_caracter}#{middle_caracter}#{border_caracter}")
        end
      end
    end

    context 'when last line must be reversed' do
      let(:left_angle_caracter) { 'A' }
      let(:right_angle_caracter) { 'B' }
      let(:reverse_last_angles) { true }

      context 'single array' do
        let(:x) { 1 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns the left border only' do
          expect(@subject.make_payload).to eq([left_angle_caracter])
        end
      end
      context 'single line' do
        let(:x) { 3 }
        let(:y) { 1 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns a single line' do
          expect(@subject.make_payload).to eq(["#{left_angle_caracter}#{border_caracter}#{right_angle_caracter}"])
        end
      end
      context 'single column' do
        let(:x) { 1 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns 3 lines' do
          expect(@subject.make_payload).to eq([left_angle_caracter, border_caracter, right_angle_caracter])
        end
      end
      context 'square matrix' do
        let(:x) { 3 }
        let(:y) { 3 }
        before do
          @subject = Rectangle.new(x, y, left_angle_caracter, right_angle_caracter, border_caracter, middle_caracter, reverse_last_angles)
        end
        it 'returns consistant midle line' do
          expect(@subject.make_payload[1]).to eq("#{border_caracter}#{middle_caracter}#{border_caracter}")
        end
      end
    end
  end
end
