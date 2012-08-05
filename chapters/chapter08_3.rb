# encoding: utf-8
$LOAD_PATH.unshift Dir.pwd
require "chapters/chapter08_1"

puts '"99本のビールが壁に..." englishNumberと以前作ったプログラムを使って、今度は正しい 方法で この歌の詩を出力させなさい。 '
99.downto(0) do |index|
  puts "#{englishNumber index} Bottles of beer on the wall"
  puts "#{englishNumber index} Bottles of beer"
  puts "Take one down and pass it around"
end