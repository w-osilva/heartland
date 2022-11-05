# frozen_string_literal: true

RSpec.describe Challenge::Photo do
  let(:attributes) do
    {
      name: 'photo',
      extension: 'jpg',
      city_name: 'Krakow',
      created_at: DateTime.strptime('2013-09-05 14:08:15', '%Y-%m-%d %H:%M:%S')
    }
  end

  describe '.new' do
    it 'build a new photo filled by attributes' do
      photo = described_class.new(attributes)
      expect(photo.name).to eql 'photo'
      expect(photo.extension).to eql 'jpg'
      expect(photo.city_name).to eql 'Krakow'
      expect(photo.created_at.to_s).to eql '2013-09-05T14:08:15+00:00'
    end
  end

  describe '#to_s' do
    subject(:photo) { described_class.new(attributes) }

    it 'returns the name + extension' do
      expect(photo.to_s).to eql 'photo.jpg'
    end
  end
end
