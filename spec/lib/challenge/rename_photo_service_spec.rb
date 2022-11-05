# frozen_string_literal: true

RSpec.describe Challenge::RenamePhotosService do
  let(:photos) do
    [
      build(:photo, created_at: DateTime.strptime('2014-09-05 14:08:15', '%Y-%m-%d %H:%M:%S')),
      build(:photo, created_at: DateTime.strptime('2013-09-05 14:08:15', '%Y-%m-%d %H:%M:%S')),
      build(:photo, created_at: DateTime.strptime('2015-09-05 14:08:15', '%Y-%m-%d %H:%M:%S'))
    ]
  end

  describe '.call' do
    it 'returns the same array of photos' do
      result = described_class.call(photos)
      expect(result.object_id).to eq photos.object_id
    end

    it 'returns photos in same order' do
      result = described_class.call(photos)
      result.each_index do |index|
        expect(result[index].object_id).to eq photos[index].object_id
      end
    end

    it 'rename photos' do
      result = described_class.call(photos)
      expect(result.map(&:name)).to eql(
        %w[
          Krakow2
          Krakow1
          Krakow3
        ]
      )
    end

    context 'when there are a group with ten or more photos' do
      let(:photos) { build_list(:photo, 10) }

      it 'rename photos with numbers leading by zeros' do
        result = described_class.call(photos)
        expect(result.map(&:name)).to eql %w[
          Krakow01
          Krakow02
          Krakow03
          Krakow04
          Krakow05
          Krakow06
          Krakow07
          Krakow08
          Krakow09
          Krakow10
        ]
      end
    end
  end
end
