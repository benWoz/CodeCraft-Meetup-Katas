class Cell

  def initialize number_of_neighbors
    @number_of_neighbors = number_of_neighbors 
  end

  def alive?
    is_within_viable_neighborhood_size? @number_of_neighbors
  end

  private
  
  def is_within_viable_neighborhood_size?(neighbors)
   viable_neighborhood_size.include? neighbors
  end

  def viable_neighborhood_size
    (2..3)
  end

end
