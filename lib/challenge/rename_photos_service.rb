# frozen_string_literal: true

module Challenge
  class RenamePhotosService
    extend Callable

    attr_reader :photos

    def initialize(photos)
      @photos = photos
    end

    def call
      rename_photos

      photos
    end

    private

    def rename_photos
      cities.each do |city_name|
        photos_from_city(city_name).each_with_index do |photo, index|
          photo_number = (index + 1)
          group_size = photos_from_city(city_name).size
          photo.name = city_name + number_leading_by_zeros(photo_number, group_size)
        end
      end
    end

    def cities
      photos.collect(&:city_name).uniq
    end

    def photos_from_city(city_name)
      @photos_from_city ||= {}
      @photos_from_city[city_name] ||= photos.select { |photo| photo.city_name == city_name }
                                             .sort_by(&:created_at)
    end

    def number_leading_by_zeros(number, max_number)
      digits = max_number.to_s.size
      format("%0#{digits}d", number)
    end
  end
end
