# frozen_string_literal: true

class DummyClass
  extend Challenge::Callable
end

RSpec.describe Challenge::Callable do
  describe '.call' do
    let(:instance) { spy(:call) }

    before { allow(DummyClass).to receive(:new).and_return instance }

    it 'creates a new instance' do
      DummyClass.call
      expect(DummyClass).to have_received(:new).once
    end

    it 'calls the instance method #call' do
      DummyClass.call
      expect(instance).to have_received(:call).once
    end
  end
end
