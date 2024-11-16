# frozen_string_literal: true

require 'rspec'
require_relative '../lib/simulator'

RSpec.describe Simulator do
  subject(:simulator) { described_class.new }

  context 'when PLACE 0,0,NORTH' do
    before do
      simulator.place(0, 0, 'NORTH')
    end

    it 'succeeds when move forward' do
      simulator.move
      expect(simulator.report).to eq('0,1,NORTH')
    end

    it 'succeeds when move left' do
      simulator.left
      expect(simulator.report).to eq('0,0,WEST')
    end

    it 'succeeds when move right' do
      simulator.right
      expect(simulator.report).to eq('0,0,EAST')
    end
  end

  context 'when PLACE 1,2,EAST' do
    before do
      simulator.place(1, 2, 'EAST')
      simulator.move
      simulator.move
      simulator.left
      simulator.move
    end

    it 'succeeds' do
      expect(simulator.report).to eq('3,3,NORTH')
    end
  end
end
