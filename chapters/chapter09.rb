# encoding: utf-8
$LOAD_PATH.unshift Dir.pwd

require 'active_support/all'

puts " 10億(One billion)秒... (もし記録が残っているなら)あなたの生まれた 正確な時刻を見つけ、いつ10億秒歳になる(あるいはなった)のかを 計算してみなさい。そしてカレンダーに印をつけましょう。"
ten_billion = 10_000_000_000
birth_day = "1950/1/1".to_date
puts "誕生日が#{birth_day.strftime("%Y年%m月%d日")}なので10億秒後は#{Time.at(birth_day.to_time + ten_billion).to_date.strftime("%Y年%m月%d日")}"

puts "ハッピーバースデー! 　生まれた年、月、そして日を順に訊いて そこから年齢を計算します。そして、過ごしてきた誕生日それぞれに対して 大きなおめでとう!をプレゼントしましょう。"
TODAY = Date.today.freeze

birth_day = :init
while birth_day == :init
  numbers = %w|年 月 日|.collect do |text|
    puts "生まれた#{text}は？"
    number = :init
    begin
      number = gets.strip.to_i.abs
    end while number.zero?
    number
  end

  unless Date.valid_date?(*numbers)
    puts "日付が正しくありません"
    next 
  end
  if TODAY < numbers.join("-").to_date
    puts "未来の日付は計算できません"
    next
  end
  birth_day = numbers.join("-").to_date
end

age = TODAY.year - birth_day.year
unless birth_day.strftime("%m%d") <= TODAY.strftime("%m%d")
  age -= 1
end

1.upto(age) do |index|
  this_bday = birth_day + index.year
  puts "#{this_bday.strftime("%Y年%m月%d日")}の#{index}歳の誕生日おめでとう"
end


puts "OrangeTreeクラスを作ってみなさい。"
require "lib/chapter09/orange_tree"
tree = OrangeTree.new
while not tree.dead?
  puts <<EOS
樹齢:#{tree.age}歳
高さ:#{tree.height}cm
オレンジの数:#{tree.countTheOranges}個
EOS
  tree.oneYearPasses
end
puts "木が枯れてしまいました"

puts "赤ちゃんドラゴンと会話が出来るようなプログラムを書いてみましょう。"
require "lib/chapter09/baby_dragon"
dragon = BabyDragon.new
while true
  command = gets.strip.downcase
  
#  http://www.ruby-forum.com/topic/115847
  case command
  when "walk"
    puts dragon.walk{ "よちよち..." }
  when "feed"
    puts dragon.eat{ "もぐもぐ..." }
  when "status"
    puts dragon.fullness
  when "quit"
    puts "終了します"
    break
  else
    puts <<EOS
コマンド
======
feed - 餌をあげます 
walk - 歩かせます（お腹が空いると歩けません）
status - 満腹度を表示します
quit - 終了します

EOS
  end
end