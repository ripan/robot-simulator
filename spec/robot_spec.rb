# frozen_string_literal: true

require 'rspec'
require_relative '../lib/position'
require_relative '../lib/robot'
RSpec.describe Robot do
  subject(:robot) { described_class.new(position: position, direction: direction) }

  let(:position) { Position.new(x_coord: 0, y_coord: 0) }

  context 'when direction is NORTH' do
    let(:direction) { 'NORTH' }

    it 'succeeds when move forward' do
      robot.move_forward
      robot.move_forward
      expect(robot.report).to eq('0,2,NORTH')
    end

    it 'succeeds when move right' do
      robot.move_right
      robot.move_forward
      expect(robot.report).to eq('1,0,EAST')
    end

    it 'succeeds when move left' do
      robot.move_right
      robot.move_forward
      robot.move_left
      robot.move_forward
      expect(robot.report).to eq('1,1,NORTH')
    end
  end

  context 'when direction is EAST' do
    let(:direction) { 'EAST' }

    it 'succeeds when move forward' do
      robot.move_forward
      robot.move_forward
      expect(robot.report).to eq('2,0,EAST')
    end
  end

  context 'when movement is INVALID' do
    context 'when direction is SOUTH' do
      let(:direction) { 'SOUTH' }

      it 'raise an error' do
        expect { robot.move_forward }.to raise_error(RuntimeError, /Movement exceed dimensions/)
      end
    end

    context 'when direction is WEST' do
      let(:direction) { 'WEST' }

      it 'raise an error' do
        expect { robot.move_forward }.to raise_error(RuntimeError, /Movement exceed dimensions/)
      end
    end
  end

  context 'when direction is INVALID' do
    let(:direction) { 'INVALID' }

    it 'fails' do
      expect { robot.move_forward }.to raise_error(RuntimeError, /Invalid direction/)
    end
  end
end
