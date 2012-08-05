# encoding: utf-8
require 'active_support/all'

puts "weddingNumberはどうでしょう? "
class Integer
  def to_english_name
    tmp = self
    words = []
    
    hundreds = tmp / 100
    unless hundreds.zero?
      english_name = to_s_less_than_100 hundreds
      words << "#{english_name} #{english_name == "one" ? "hundred" : "hundreds"}"
      tmp -= hundreds * 100
    end
    words << "#{to_s_less_than_100 tmp}"
    words.compact.reject(&:blank?).join " and "
  end
  
  private
    def to_s_less_than_100(number)
      less_than_20 = %w|one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen|.inject({}) do |all, name|
        all[all.keys.size + 1] = name
        all
      end
      tens = %w|twenty thrity fourty fifty sixty seventy eighty ninety|.inject({}) do |all, name|
        all[all.keys.size + 2] = name
        all
      end
      words = []

      case true
      when number < 20
        words << less_than_20[number]
      when 20 <= number
        how_many_tens = number / 10
        words << tens[how_many_tens]
        words << to_s_less_than_100(number - how_many_tens * 10)
      end
      
      words.compact.reject(&:blank?).join " and "
    end
end



def englishNumber number
	number = number.to_i
  return "zero" if number.zero?
  negative = number < 0 ? true : false
  
  number_names = %w|
    Million
    Billion
    Trillion
    Quadrillion
    Quintillion
    Sextillion
    Septillion
    Octillion
    Nonillion
    Decillion
    Undecillion
    Duodecillion
    Tredecillion
    Quattuordecillion
    Quindecillion
    Sexdecillion
    Septendecillion
    Octodecillion
    Novemdecillion
    Vigintillion
    Centillion
  |.inject({"Thousand" => 3}) do |all, name|
    all[name] = all[all.keys.last] + 3
    all
  end
  
  words = number_names.keys.reverse.collect do |name|
    result = number / (10 ** number_names[name])
    if result.zero?
      nil
    else
      english_name = result.to_english_name
      number -= result * (10 ** number_names[name])
      "#{english_name} #{english_name == "one" ? name : name.pluralize}"
    end
  end.compact
  
  words << number.to_english_name
  words = words.compact.reject(&:blank?).join(" and ").strip
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)



