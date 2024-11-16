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
    raise 'Invalid direction' unless DIRECTIONS.include?(@direction)

    send("advance_to_#{direction.downcase}")
    validate_movement!
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

  def validate_movement!
    raise 'Movement exceed dimensions' unless @position.valid?
  end

  def advance_to_north
    @position.y_coord += 1
  end

  def advance_to_east
    @position.x_coord += 1
  end

  def advance_to_south
    @position.y_coord -= 1
  end

  def advance_to_west
    @position.x_coord -= 1
  end
end
