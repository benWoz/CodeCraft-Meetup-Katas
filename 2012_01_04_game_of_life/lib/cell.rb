class Cell

  def initialize number_of_neighbors
    @number_of_neighbors = number_of_neighbors 
  end

  def alive?
    viable_neighborhood_size.include? @number_of_neighbors
  end

  private
  
  def viable_neighborhood_size
    (2..3)
  end

end
