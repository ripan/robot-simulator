# frozen_string_literal: true

# Move and display the position of Robot
class Robot
  attr_accessor :position, :direction

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(position:, direction:)
    @position = position
    @direction = direction
  end

  def move_forward
    case @direction
    when 'NORTH'
      @position.y_coord += 1
    when 'EAST'
      @position.x_coord += 1
    when 'SOUTH'
      @position.y_coord -= 1
    when 'WEST'
      @position.x_coord -= 1
    else
      raise 'Invalid direction'
    end
    validate!
  end

  def move_right
    index = (DIRECTIONS.find_index(@direction) + 1) % DIRECTIONS.count
    @direction = DIRECTIONS[index]
  end

  def move_left
    index = (DIRECTIONS.find_index(@direction) - 1) % DIRECTIONS.count
    @direction = DIRECTIONS[index]
  end

  def report
    [@position.to_s, @direction.to_s].join(',')
  end

  private

  def validate!
    raise 'Movement exceed dimensions' unless @position.valid?
  end
end
