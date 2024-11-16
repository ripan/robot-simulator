# frozen_string_literal: true

require 'rspec'
require_relative '../lib/position'

RSpec.describe Position do
  subject(:position) { described_class.new(x_coord: x_coord, y_coord: y_coord) }

  let(:x_coord) { 1 }
  let(:y_coord) { 1 }

  it 'returns position as string' do
    expect(position.to_s).to eq('1,1')
  end

  describe '#valid?' do
    context 'when valid max coordinates' do
      let(:x_coord) { 5 }
      let(:y_coord) { 5 }

      it 'returns valid' do
        expect(position).to be_valid
      end
    end

    context 'when valid min coordinates' do
      let(:x_coord) { 0 }
      let(:y_coord) { 0 }

      it 'returns valid' do
        expect(position).to be_valid
      end
    end

    context 'when invalid max coordinates' do
      let(:x_coord) { 6 }
      let(:y_coord) { 6 }

      it 'returns invalid' do
        expect(position).not_to be_valid
      end
    end

    context 'when invalid min coordinates' do
      let(:x_coord) { -1 }
      let(:y_coord) { -1 }

      it 'returns invalid' do
        expect(position).not_to be_valid
      end
    end
  end
end
