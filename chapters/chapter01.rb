# encoding: utf-8

require 'active_support/all'
require 'action_view'
helper = Object.new
helper.class_eval do 
  include ActionView::Helpers::NumberHelper 
end

puts "1年は何時間でしょうか？"
puts "#{helper.number_with_delimiter (1.year / 1.hour).to_i}時間"

puts "10年間は何分でしょうか？"
puts "#{helper.number_with_delimiter (10.year / 1.minute).to_i}分"

puts "あなたが生まれてから今日まで何秒たっているでしょうか?"
birth_day = "1950/01/01"
puts "#{helper.number_with_delimiter Time.now.to_i - birth_day.to_time.to_i}秒"

puts "あなたは一生のうちいくつのチョコレートを食べたいですか? "
years_to_live = 70
how_many_to_eat_in_a_month = 2
how_many_to_eat_in_a_year = how_many_to_eat_in_a_month * 12
puts "#{helper.number_with_delimiter (years_to_live * how_many_to_eat_in_a_year)}個"

puts "私が生まれてから10億3400万秒 たっているとしたら、私は今何歳でしょう?"
puts "満#{(103_4000_000 / 1.year).to_i}歳"
