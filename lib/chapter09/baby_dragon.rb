# encoding: utf-8
class BabyDragon
  attr_reader :fullness
  
  def initialize
    @fullness = 0
  end
  
  def eat
    if 100 < @fullness + 10
      @fullness = 100
      "お腹いっぱい"
    else
      @fullness += 10
      yield if block_given?
    end
  end
  
  def walk
    @fullness -= 5
    
    if @fullness < 0 
      @fullness = 0
      return "もう歩けない"  
    end
    
    yield if block_given?
  end
  
  def hungry?
    @fullness < 30
  end
  
end