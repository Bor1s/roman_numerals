require "spec_helper"

RSpec.describe RomanNumerals::Converter do
  describe '#convert' do
    context 'for arabic numeral' do
      subject { described_class.new('1') }

      it 'calls #convert on ArabicNumber strategy' do
        allow_any_instance_of(RomanNumerals::ArabicNumber).to receive(:convert)
        subject.convert
      end
    end

    context 'for roman numeral' do
      subject { described_class.new('X') }

      it 'calls #convert on RomanNumber strategy' do
        allow_any_instance_of(RomanNumerals::RomanNumber).to receive(:convert)
        subject.convert
      end
    end
  end
end
