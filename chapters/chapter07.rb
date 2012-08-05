# encoding: utf-8
require 'active_support/all'

puts "好きな数だけ単語の入力をしてもらい(1行に1単語、最後はEnterだけの空行)、 アルファベット順に並べ変えて出力するようなプログラムを書いてみましょう?"
words = []
begin
  word = gets.chomp
  words << word
end while not word.empty?
puts "ソートしました！"
puts words.reject(&:empty?).sort.join "\n"


puts "上のプログラムをsortメソッドなしで 書けますか。プログラミングの大部分は、問題解決にあります。 これはいい練習になります。"
words = []
begin
  word = gets.chomp
  words << word
end while not word.empty?
words = words.reject(&:empty?)

[
  (1...words.size),
  (1...words.size).to_a.reverse
].each do |indexes|
  indexes.each do |index|
    prev_index = index - 1
    prev_word = words[prev_index]
    current_word = words[index]

    if (words[prev_index] <=> words[index]) == 1
      words[prev_index] = current_word
      words[index] = prev_word
    end
  end
end
puts "ソートしました！"
puts words.join "\n"

puts "以前、メソッドの章で書いた 目次を表示するプログラムを修正してみましょう。その際、プログラムの最初で 目次の情報(つまり、章の名前やページ番号など)をすべてひとつの配列にしまいます。"
#               目  次                       
#                                            
#1章:  数                                p. 1
#2章:  文字                             p. 72
#3章:  変数                            p. 118
WIDTH = 40.freeze
[
  %w|目次|,
  %w|数 1|,
  %w|文字 72|,
  %w|変数 118|
].each_with_index do |(title, page), index|
  if page.present?
    puts "#{index.succ}章:  #{title}".ljust(WIDTH / 2) + 
      "p. #{page}".rjust(WIDTH / 2)
  else
    puts title.center(WIDTH)
  end
end
