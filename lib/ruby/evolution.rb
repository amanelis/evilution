module Evolution
  class Client
    def initialize

    end
  end
  
  autoload :Algorithm,    "./evolution/algorithm"
  autoload :FitnessCalc,  "./evolution/fitness_calc"
  autoload :Individual,   "./evolution/individual"
  autoload :Population,   "./evolution/population" 
end

Evolution::Population.new 50, true

# Docs: http://www.theprojectspot.com/tutorial-post/creating-a-genetic-algorithm-for-beginners/3