# frozen_string_literal: true

RSpec.describe Challenge do
  describe '.solution' do
    let(:input) do
      "photo.jpg, Krakow, 2013-09-05 14:08:15\n" \
        "Mike.png, London, 2015-06-20 15:13:22\n" \
        "myFriends.png, Krakow, 2013-09-05 14:07:13\n" \
        "Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02\n" \
        "pisatower.jpg, Florianopolis, 2015-07-22 23:59:59\n" \
        "BOB.jpg, London, 2015-08-05 00:02:03\n" \
        "notredame.png, Florianopolis, 2015-09-01 12:00:00\n" \
        "me.jpg, Krakow, 2013-09-06 15:40:22\n" \
        "a.png, Krakow, 2016-02-13 13:33:50\n" \
        "b.jpg, Krakow, 2016-01-02 15:12:22\n" \
        "c.jpg, Krakow, 2016-01-02 14:34:30\n" \
        "d.jpg, Krakow, 2016-01-02 15:15:01\n" \
        "e.png, Krakow, 2016-01-02 09:49:09\n" \
        "f.png, Krakow, 2016-01-02 10:55:32\n" \
        'g.jpg, Krakow, 2016-02-29 22:13:11'
    end

    it 'returns renamed photos' do
      output = described_class.solution(input).map(&:to_s)

      expect(output).to eql(%w[
                              Krakow02.jpg
                              London1.png
                              Krakow01.png
                              Florianopolis2.jpg
                              Florianopolis1.jpg
                              London2.jpg
                              Florianopolis3.png
                              Krakow03.jpg
                              Krakow09.png
                              Krakow07.jpg
                              Krakow06.jpg
                              Krakow08.jpg
                              Krakow04.png
                              Krakow05.png
                              Krakow10.jpg
                            ])
    end
  end
end
