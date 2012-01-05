require "./lib/cell.rb"

describe Cell do
  
  it "dies if it has less than two neighbors to hook up with" do
    first_life = Cell.new(0)
    first_life.alive?.should eql false 
  end

end
