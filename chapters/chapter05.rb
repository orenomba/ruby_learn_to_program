# encoding: utf-8
require 'active_support/all'

puts "「怒ったボス」のプログラムを書いてみましょう。 まず、無作法に何が望みか聞いてきます。 で、何を答えようと「怒ったボス」はそれを叫び返して、あなたを首にします。"
puts "空文字Enterで終了します"
while x = gets.strip
  break if x.blank?
  puts %|なにぃ? "#{x}" だとー!! おまえは首だ!! |
end

puts "center, ljust, そして rjust を使ってもう少し何かやってみましょう。こんな感じの「目次」を表示する プログラムを書いてみてください。"
#               目  次                       
#                                            
#1章:  数                                p. 1
#2章:  文字                             p. 72
#3章:  変数                            p. 118
WIDTH = 40.freeze
puts "目次".center(WIDTH)
[
  %w|数 1|,
  %w|文字 72|,
  %w|変数 118|
].each_with_index do |(title, page), index|
  puts "#{index.succ}章:  #{title}".ljust(WIDTH / 2) + 
    "p. #{page}".rjust(WIDTH / 2)
end
