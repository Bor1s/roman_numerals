require "spec_helper"

RSpec.describe RomanNumerals::RomanNumber do
  describe '#initialize' do
    context 'for roman numeral given' do
      it 'builds instance' do
        expect(described_class.new('X')).to be_an_instance_of(described_class)
      end
    end

    context 'for other numeral given' do
      it 'raises ArgumentError' do
        expect { described_class.new(1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#convert' do
    context 'for roman numeral given' do
      subject { described_class.new('DCC') }

      it 'returns corresponding arabic number' do
        expect(subject.convert).to eq 700
      end
    end
  end
end
