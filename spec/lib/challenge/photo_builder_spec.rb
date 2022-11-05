# frozen_string_literal: true

RSpec.describe Challenge::PhotoBuilder do
  describe '.call' do
    let(:input) { 'photo.jpg, Krakow, 2013-09-05 14:08:15' }

    it 'returns a instance of Photo' do
      expect(described_class.call(input)).to be_an_instance_of(Challenge::Photo)
    end

    it 'returns a Photo filled by input data' do
      photo = described_class.call(input)
      expect(photo.name).to eql 'photo'
      expect(photo.extension).to eql 'jpg'
      expect(photo.city_name).to eql 'Krakow'
      expect(photo.created_at.to_s).to eql '2013-09-05T14:08:15+00:00'
    end

    context 'when the input contains a invalid file_name' do
      let(:input) { 'photo.web, Krakow, 2013-09-05 14:08:15' }

      it { expect { described_class.call(input) }.to raise_error(ArgumentError, /Invalid file_name/) }
    end

    context 'when the input contains a invalid city_name' do
      let(:input) { 'photo.jpg, New York, 2013-09-05 14:08:15' }

      it { expect { described_class.call(input) }.to raise_error(ArgumentError, /Invalid city_name/) }
    end

    context 'when the input contains a invalid datetime' do
      let(:input) { 'photo.jpg, Krakow, 2013-09-05T14:08:15' }

      it { expect { described_class.call(input) }.to raise_error(ArgumentError, /Invalid datetime/) }
    end
  end

  describe '.FILE_NAME_REGEX' do
    it { expect(described_class::FILE_NAME_REGEX).to eql '^[a-z]{1,}\.(png|jpg|jpeg)$' }
  end

  describe '.CITY_NAME_REGEX' do
    it { expect(described_class::CITY_NAME_REGEX).to eql '^[a-z]{1,}$' }
  end

  describe '.DATE_TIME_REGEX' do
    it { expect(described_class::DATE_TIME_REGEX).to eql '^[0-9]{4}-[0-9]{2}-[0-9]{2}\s[0-9]{2}:[0-9]{2}:[0-9]{2}$' }
  end
end
