# frozen_string_literal: true

RSpec.describe Challenge do
  describe '.solution' do
    it { expect(described_class.methods).to include :solution }
  end
end
