# encoding: utf-8
require 'active_support/all'

#http://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q1021565085
#＞みかんの木の寿命はどれくらい？
#
#ほぼ人間と同じくらいです。 
#みかんはおよそ、４年目ぐらいから実を着け始め、３０年目から４０年目ぐらいになると、生産量が落ちてくると言われております。
class OrangeTree
  MAX_ORANGES = 500.freeze
  MAX_HEIGHT_IN_CM = 400.freeze
  attr_reader :age, :height
  
  def initialize
    @height = 0
    @age = 0
    @orangeCount = 0
    
    @age_to_live = 1 + SecureRandom.random_number(80)
    @age_to_grow_less = 30 + SecureRandom.random_number(10)
    @ages_to_grow_more = (3..@age_to_grow_less).to_a

    @max_growth = :init
    while @max_growth == :init
      tmp = SecureRandom.random_number
      @max_growth = tmp unless tmp.zero?
    end

    #最悪の場合は1より小さくなるので切り上げる
    @max_oranges = (MAX_ORANGES * @max_growth).ceil
    @max_height = (MAX_HEIGHT_IN_CM * @max_growth).ceil
  end
  
  def dead?
    @dead
  end
  
  def oneYearPasses
    if @age_to_live <= (@age + 1)
      @orangeCount = 0
      @dead = true
      return "寿命で枯れてしまいました"
    end
    
    @age += 1
    @height += (@max_height / 10).ceil if @age <= 10
    
    return if @age <= @ages_to_grow_more.first

    if @ages_to_grow_more.include?(@age)
      growth_percentage = @ages_to_grow_more.index(@age) / @ages_to_grow_more.size.to_f
      @orangeCount = (@max_oranges * growth_percentage).ceil
    else
      growth_percentage = (1 + SecureRandom.random_number(@ages_to_grow_more.size)) / @ages_to_grow_more.size.to_f
      @orangeCount = (@max_oranges * growth_percentage).ceil
    end
    
    nil
  end
  
  def countTheOranges
    @orangeCount
  end
  
  def pichAnOrange
    if 0 <= (@orangeCount - 1)
      @orangeCount -= 1
      "このオレンジはおいしかった"
    else
      "もう木にオレンジがなっていない"
    end
  end
end