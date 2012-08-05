# encoding: utf-8
require 'active_support/all'

puts '"99本のビールが壁に..." 遠足などでよく歌われる古典的な童謡の歌詞、"99 Bottles of Beer on the Wall" を 出力するプログラムを書いてみましょう。 （訳註:マザーグースの歌なのですが、日本ではあまりメジャーではないので、 出力例をあげておきます。)'
99.downto(0) do |index|
  puts "#{index} Bottles of beer on the wall"
  puts "#{index} Bottles of beer"
  puts "Take one down and pass it around"
end


puts "耳の遠いおばあちゃんのプログラムを書いてみましょう。"
while x = gets.strip
  break if x == "BYE"
  
  if x =~ /\A[A-Z]+\z/
    puts "いやー、#{1930 + SecureRandom.random_number(20)}年以来ないねー!"
  else
    puts "は?! もっと大きな声で話しておくれ、坊や!"
  end
end

puts "上で作った、「耳の遠いおばあちゃんのプログラム」を拡張しましょう。 おばあちゃんはあなたに行って欲しくないのです。"
class GrandMaDoesntWantMeGo
  def initialize
    @dont_want_me_go = 0
  end
  
  def listen_grandma!
    while x = gets.strip
      if x == "BYE"
        @dont_want_me_go += 1
        break if 3 <= @dont_want_me_go
        next
      end
      @dont_want_me_go = 0
      
      if x =~ /\A[A-Z]+\z/
        puts "いやー、#{1930 + SecureRandom.random_number(20)}年以来ないねー!"
      else
        puts "は?! もっと大きな声で話しておくれ、坊や!"
      end
    end
  end
end

GrandMaDoesntWantMeGo.new.listen_grandma!


puts "うるう年。 開始の年と終わりの年を聞いて、その間にあるすべてのうるう年を (もし開始や終了の年がうるう年だったらそれも含めて)表示するプログラムを書きましょう。"
start_year, end_year = %w|開始 終わり|.collect do |text|
  puts "#{text}の年は？"
  year = :init
  begin
    year = gets.to_i
  end while year <= 0
  year
end.sort

puts "#{start_year}年から#{end_year}年で..."
start_year.upto(end_year).find_all do |year|
  Date.gregorian_leap?(year)
end.each do |year|
  puts "#{year}年は閏年です"
end
