# frozen_string_literal: true

module Challenge
  class Photo
    ATTRIBUTES = %i[
      name
      created_at
      city_name
      extension
    ].freeze

    attr_accessor(*ATTRIBUTES)

    def initialize(attributes = {})
      attributes.each do |key, value|
        next unless ATTRIBUTES.include?(key.to_sym)

        instance_variable_set("@#{key}", value)
      end
    end

    def to_s
      "#{name}.#{extension}"
    end
  end
end
