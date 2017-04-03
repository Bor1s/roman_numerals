module RomanNumerals
  class RomanNumber
    ROMAN_TO_ARABIC_MAP = {
      'M' => 1000,'C' => 100, 'X' => 10, 'I' => 1,
      'MM' => 2000, 'CC' => 200, 'XX' => 20, 'II' => 2,
      'MMM' => 3000, 'CCC' => 300, 'XXX' => 30, 'III' => 3,
      'CD' => 400, 'XL' => 40, 'IV' => 4,
      'D' => 500, 'L' => 50, 'V' => 5,
      'DC' => 600, 'LX' => 60, 'VI' => 6,
      'DCC' => 700, 'LXX' => 70, 'VII' => 7,
      'DCCC' => 800, 'LXXX' => 80, 'VIII' => 8,
      'CM' => 900, 'XC' => 90, 'IX' => 9
    }

    def initialize(number)
      raise ArgumentError, 'not a roman number' unless number.is_a?(String)
      @number = number
    end

    def convert
      string_number = @number.dup
      @total = 0
      memo = ''

      while string_number.length > 0 do
        current_character = string_number[0]

        if memo.empty?
          if ROMAN_TO_ARABIC_MAP[current_character]
            memo << current_character
            string_number.slice!(current_character)
          end
        else
          if ROMAN_TO_ARABIC_MAP[memo + current_character]
            memo << current_character
            string_number.slice!(current_character)
          else
            @total += ROMAN_TO_ARABIC_MAP[memo]
            memo = ''
          end
        end
      end

      @total += ROMAN_TO_ARABIC_MAP[memo]
      @total
    end
  end
end
