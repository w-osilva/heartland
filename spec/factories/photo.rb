# frozen_string_literal: true

FactoryBot.define do
  factory :photo, class: 'Challenge::Photo' do
    name { 'photo' }
    extension { 'jpg' }
    city_name { 'Krakow' }
    created_at { DateTime.now }
  end
end
