# frozen_string_literal: true

require_relative 'position'
require_relative 'robot'
# Simulate the movement of the Robot
class Simulator
  attr_reader :position, :robot

  def place(x_coord, y_coord, direction)
    @position = Position.new(x_coord: x_coord, y_coord: y_coord)
    @robot = Robot.new(position: @position, direction: direction)
  end

  def move
    robot.move_forward
  end

  def right
    robot.move_right
  end

  def left
    robot.move_left
  end

  def report
    robot.report
  end
end
