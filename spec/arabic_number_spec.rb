require "spec_helper"

RSpec.describe RomanNumerals::ArabicNumber do
  describe '#initialize' do
    context 'for arabic numeral given' do
      it 'builds instance' do
        expect(described_class.new(1)).to be_an_instance_of(described_class)
      end
    end

    context 'for other numeral given' do
      it 'raises ArgumentError' do
        expect { described_class.new('str') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#convert' do
    context 'for arabic numeral given' do
      subject { described_class.new(1) }

      it 'returns corresponding roman number' do
        expect(subject.convert).to eq 'I'
      end
    end
  end
end
