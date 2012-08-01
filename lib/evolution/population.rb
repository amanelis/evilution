module Evolution
  class Population  
    #
    # instance variables
    attr_accessor :individuals # @individuals.class => Evolution::Individual
    
      
    # initialize
    # @param: Integer[populationSize]
    # @param: Boolean[initialise]
    def initialize populationSize, initialise
      raise ArgumentError, 'Wrong number of parameters' if populationSize.nil? || initialise.nil? 
      
      # initialize our individuals instance
      @individuals = Evolution::Individual.new populationSize
    end
  end  
end