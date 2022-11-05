# frozen_string_literal: true

Dir[File.join(__dir__, 'challenge', '**', '*.rb')].each { |file| require file }

module Challenge
  module_function

  def solution(input)
    photos = input.split("\n").map { |string| PhotoBuilder.call(string) }
  end
end
