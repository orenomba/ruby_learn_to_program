# encoding: utf-8
require "chapter09/baby_dragon"

describe BabyDragon do
  before(:each) do
    @dragon = BabyDragon.new
  end
  
  it "should have eat" do
    @dragon.should respond_to :eat
  end
  
  it "should have walk" do
    @dragon.should respond_to :walk
  end
  
  it "should have fullness" do
    @dragon.should respond_to :fullness
  end
  
  it "should have hungry?" do
    @dragon.should respond_to :hungry?
  end
  
  describe "eating" do
    before(:each) do
      @dragon.instance_eval{ @fullness = 0 }
    end
    
    it "should eat and fill stomach" do
      lambda{
        @dragon.eat()
      }.should change(@dragon, :fullness)
    end
    
    it "should avoid eating when full" do
      @dragon.instance_eval{ @fullness = 100 }
      @dragon.eat().should == "お腹いっぱい"
    end
    
    it "should take a block" do
      @dragon.eat do 
        "test"
      end.should == "test"
    end
  end
  
  describe "walking" do
    before(:each) do
      @dragon.instance_eval{ @fullness = 100 }
    end
    
    it "should reduce fullness as it walks" do
      previous = @dragon.fullness
      3.times do 
        @dragon.walk()
        current = @dragon.fullness
        current.should < previous
      end
    end
    
    it "should stop walking when starved" do
      @dragon.instance_eval{ @fullness = 0 }
      @dragon.walk().should == "もう歩けない"
    end
    
    it "should fix to zero when fullness goes negative" do
      @dragon.instance_eval{ @fullness = 2 }
      lambda{
        @dragon.walk()
      }.should change(@dragon, :fullness).to 0
    end
    
    it "should take a block" do
      @dragon.walk do
        "test"
      end.should == "test"
    end
  end
  
  describe "hungry?" do
    it "should return boolean" do
      @dragon.instance_eval{ @fullness = 100 }
      @dragon.hungry?.should == false
    end
 
    it "should be true when fullness < 30" do
      @dragon.instance_eval{ @fullness = 20 }
      @dragon.should be_hungry
    end
  end
end