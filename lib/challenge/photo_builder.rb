# frozen_string_literal: true

require 'date'

module Challenge
  class PhotoBuilder
    extend Callable

    attr_reader :string

    def initialize(string)
      @string = string
    end

    def call
      file_name, city_name, created_at = string.split(',').map(&:strip)
      validate_file_format(file_name)
      validate_city_format(city_name)
      validate_datetime_format(created_at)

      Photo.new(
        name: file_name.split('.').first,
        extension: file_name.split('.').last,
        city_name: city_name.capitalize,
        created_at: ::DateTime.strptime(created_at, '%Y-%m-%d %H:%M:%S')
      )
    end

    FILE_NAME_REGEX = '^[a-z]{1,}\.(png|jpg|jpeg)$'
    CITY_NAME_REGEX = '^[a-z]{1,}$'
    DATE_TIME_REGEX = '^[0-9]{4}-[0-9]{2}-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0-9]{2}$'

    private

    def validate_file_format(input)
      return if input.match?(/#{FILE_NAME_REGEX}/io)

      raise ArgumentError, 'Invalid file_name'
    end

    def validate_city_format(input)
      return if input.match?(/#{CITY_NAME_REGEX}/io)

      raise ArgumentError, 'Invalid city_name'
    end

    def validate_datetime_format(input)
      return if input.match?(/#{DATE_TIME_REGEX}/io)

      raise ArgumentError, 'Invalid datetime'
    end
  end
end
