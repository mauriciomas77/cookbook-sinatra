class Recipe
  attr_reader :name, :description, :time, :difficult
  attr_accessor :done
  def initialize(name, description = "N/A", time = "N/A", done = false, difficult = "N/A")
    @name = name
    @description = description
    @time = time
    @done = done
    @difficult = difficult
  end
end
