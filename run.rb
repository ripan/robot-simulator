# frozen_string_literal: true

require_relative 'lib/simulator'

simulator = Simulator.new

# PLACE 0,0,NORTH
simulator.place(0, 0, 'NORTH')
simulator.move
puts simulator.report

# PLACE 0,0,NORTH
simulator.place(0, 0, 'NORTH')
simulator.left
puts simulator.report

# PLACE 1,2,EAST
simulator.place(1, 2, 'EAST')
simulator.move
simulator.move
simulator.left
simulator.move
puts simulator.report
