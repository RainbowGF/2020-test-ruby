# frozen_string_literal: true
require "tty-prompt"
require_relative '../lib/auto'
require_relative '../lib/fleet'

def main
  auto_one = Auto.new('xyemarka', 'xyemodel', 2000, 12.5)
  puts auto_one
  fleet = Fleet.new
  prompt = TTY::Prompt.new
  if prompt.yes?("do you want to read from file?")
    fleet.load_from_file(__dir__ << '/../data/cars-list.json') 
  else 
    fleet.load_from_stream
  end

  puts fleet.average_consumption

  puts fleet.number_by_brand('BMW')

  puts fleet.number_by_model('X5 3,0D')

  puts fleet.consumption_by_brand('BMW')
end

main if __FILE__ == $PROGRAM_NAME
