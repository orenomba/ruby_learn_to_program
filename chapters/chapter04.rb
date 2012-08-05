# encoding: utf-8
require 'active_support/all'

puts "最初に姓、次に名前を聞いて、最後にフルネームに対してあいさつを するようなプログラムを書いてみましょう。"
def must_answer(message)
	puts message
  user_input = :init
  begin
    user_input = gets.strip
    puts "入力されていません" if user_input.blank?
  end while user_input.blank?
  
  user_input
end
last, first = %w|あなたの苗字を入力してください あなたの名前を入力してください|.collect do |q|
  must_answer q
end
puts "こんにちわ #{last} #{first}さん"


puts "好きな数を入力してもらい、それに1を加えて、その結果を ベターな 数字として薦めるプログラムを書きましょう。 (機転の利いたサジェスチョンに努めましょう。)"
puts "好きな数字は何ですか？"
class String
  def integer?
    Integer(self) != nil rescue false
  end
end
while favorite = gets.strip
  unless favorite.integer?
    puts "整数で入力してください" 
    next
  end
  puts "#{favorite.to_i + 1}の方が良くないですか？"
  break
end 
