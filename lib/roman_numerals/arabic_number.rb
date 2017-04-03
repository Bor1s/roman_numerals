module RomanNumerals
  class ArabicNumber
    ARABIC_TO_ROMAN_MAP = {
      1 => "I",
      4 => "IV",
      5 => "V",
      9 => "IX",
      10 => "X",
      40 => "XL",
      50 => "L",
      90 => "XC",
      100 => "C",
      400 => "CD",
      500 => "D",
      900 => "CM",
      1000 => "M"
    }

    def initialize(number)
      if !number.respond_to?(:integer?) || !number.integer?
        raise ArgumentError, 'not integer arabic number'
      end

      @number = number
      @addends = decompose_into_addends(@number)
    end

    def convert
      @addends.each_with_index.map do |num, idx|
        process_convertion(num)
      end.join('')
    end

    private

    def decompose_into_addends(number)
      return [number] if (number % 10).zero?
      number.to_s.reverse.each_char.with_index.map do |c,idx|
        ("#{c}"+"0"*idx).to_i
      end.reverse
    end

    def process_convertion(arabic_num)
      result = ARABIC_TO_ROMAN_MAP[arabic_num]
      return result if result
      array_of_roman_numbers = ARABIC_TO_ROMAN_MAP.to_a

      gaps = {}
      ARABIC_TO_ROMAN_MAP.each_pair do |arabic_number, roman_number|
        difference = arabic_num - arabic_number
        gaps[arabic_number] = difference unless difference < 0
      end

      min_gap = gaps.sort { |a,b| a[1] <=> b[1] }.first[0]

      "#{ARABIC_TO_ROMAN_MAP[min_gap]}#{process_convertion(arabic_num - min_gap)}"
    end
  end
end
