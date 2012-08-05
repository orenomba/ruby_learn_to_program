# encoding: utf-8
require "chapter09/orange_tree"

describe OrangeTree do
  before(:each) do
    @tree = OrangeTree.new
  end
  
  it "should have age" do
    @tree.should respond_to :age
  end
  
  it "should have height" do
    @tree.should respond_to :height
  end
  
  it "should have countTheOranges" do 
    @tree.should respond_to :countTheOranges
  end
  
  it "should have oneYearPasses" do
    @tree.should respond_to :oneYearPasses
  end
  
  it "should have pichAnOrange" do
    @tree.should respond_to :pichAnOrange
  end
  
  it "should have dead?" do
    @tree.should respond_to :dead?
  end
  
  describe "oneYearPasses" do
    before(:each) do
      @tree.instance_eval{ @age_to_live = 100}
    end
    
    it "should age by year" do
      lambda{
        @tree.oneYearPasses()
      }.should change(@tree, :age).by(1)
    end
    
    it "should grow by year" do
      lambda{
        @tree.oneYearPasses()
      }.should change(@tree, :height)
    end

    describe "when it dies" do
      before(:each) do
        @tree.instance_eval do
          @age_to_live = 50
          @age = 50
        end
      end

      it "shouldn't change age" do
        lambda{
          @tree.oneYearPasses()
        }.should_not change(@tree, :age)
      end
      
      it "shouldn't grow anymore" do
        lambda{
          @tree.oneYearPasses()
        }.should_not change(@tree, :height)
      end
      
      it "shouldn't have any oranges" do
        @tree.oneYearPasses()
        @tree.countTheOranges().should be_zero
      end
      
      it "should be dead" do
        @tree.oneYearPasses()
        @tree.should be_dead
      end
    end
    
    describe "as it grows.." do
      before(:each) do
        @tree.instance_eval{ @max_growth = 1.0 }
      end
      
      it "shouldn't have oranges at early ages" do
        3.times do
          @tree.oneYearPasses()
          @tree.countTheOranges().should be_zero
        end
      end
      
      it "should start having oranges at 4th year" do
        4.times{ @tree.oneYearPasses() }
        @tree.countTheOranges().should_not be_zero
      end
      
      it "should grow in height until 10th year" do
        10.times do
          lambda{
            @tree.oneYearPasses()
          }.should change(@tree, :height)
        end
      end
      
      it "should stop growing in height at 10th year" do
        10.times{ @tree.oneYearPasses() }
        lambda{
          @tree.oneYearPasses()
        }.should_not change(@tree, :height)
      end

      
      describe "after start growing oranges" do
        before(:each) do
          4.times{ @tree.oneYearPasses() }
        end
        
        describe "picking oranges" do
          before(:each) do
            @tree.instance_eval{ @orangeCount = 1 }
          end
          
          it "should take 1 from orangeCount" do
            lambda{
              @tree.pichAnOrange()
            }.should change(@tree, :countTheOranges).by -1
          end
          
          it "should give message when picked" do
            @tree.pichAnOrange().should == "このオレンジはおいしかった"
          end
          
          it "should give message when out" do
            @tree.countTheOranges().times{ @tree.pichAnOrange() }
            @tree.pichAnOrange().should == "もう木にオレンジがなっていない"
          end
        end
        
        it "should have more oranges year by year" do
          last_year_oranges = @tree.countTheOranges()
          10.times do
            @tree.oneYearPasses()
            current_oranges = @tree.countTheOranges()
            last_year_oranges.should <= current_oranges
            
            last_year_oranges = current_oranges 
          end
        end
      end
    end
  end
end