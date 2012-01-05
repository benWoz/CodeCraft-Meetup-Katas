require "./lib/cell.rb"

describe Cell do
  
  it "dies if it has less than two neighbors to hook up with" do
    first_life = Cell.new(1)
    first_life.alive?.should eql false 
  end

  it "lives with two neighbors" do
    first_life = Cell.new(2)
    first_life.alive?.should eql true
  end

  it "lives with three neighbors" do
    first_life = Cell.new(3)
    first_life.alive?.should eql true
  end

  it "dies if it has more than three neighors" do
    first_life = Cell.new(4)
    first_life.alive?.should eql false
  end

end
