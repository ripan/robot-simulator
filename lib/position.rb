# frozen_string_literal: true

# Set and Output the position of Robot
class Position
  attr_accessor :x_coord, :y_coord

  GRID_SIZE = 5

  def initialize(x_coord: 0, y_coord: 0)
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def valid?
    @x_coord.between?(0, GRID_SIZE) && @y_coord.between?(0, GRID_SIZE)
  end

  def to_s
    [@x_coord, @y_coord].join(',')
  end
end
