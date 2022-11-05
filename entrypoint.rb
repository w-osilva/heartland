# frozen_string_literal: true

require 'debug'
require_relative 'lib/challenge'

input = File.read(File.join(__dir__, 'PHOTOS.txt'))
puts Challenge.solution(input)
