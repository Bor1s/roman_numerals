module RomanNumerals
  class Converter
    def initialize(string_number)
      @string_number = string_number.to_s
      @strategy = define_strategy
    end

    def convert
      @strategy.convert
    end

    private

    def arabic_number?
      @string_number.match? /\A[0-9]*\z/
    end

    def roman_number?
      @string_number.match? /\A(I|V|C|D|L|M|X)*\z/
    end

    def define_strategy
      return ArabicNumber.new(@string_number.to_i) if arabic_number?
      return RomanNumber.new(@string_number) if roman_number?
    end
  end
end
