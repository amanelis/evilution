module Evolution
  class Algorithm
    #
    # instance variables
    attr_accessor :uniformRate
    attr_accessor :mutationRate
    attr_accessor :tournamentSize
    attr_accessor :elitism
    
    #
    # static variables
    UNIFORM_RATE = 0.5;
    MUTATION_RATE = 0.015;
    TOURNAMENT_SIZE = 5;
    ELITISM = true;
    
    ## initialize
    # @param: 
    # @return:
    def initialize 
      @uniformRate = 0.5
      @mutationRate = 0.015
      @tournamentSize = 5
      @elitism = true
    end
      
    ## evolvePopulation
    # @param: Population[population]
    # @return: 
    def self.evolvePopulation population
      newPopulation = Evolution::Population.new population.size, false
      
      # Keep our best individual
      if @elitism 
        newPopulation.saveIndividual 0, population.getFittest
      end
      
      # Crossover population
      elitismOffset = @elitism ? 1 : 0
      
      # Loop over the population size and create new individuals with
      # crossover
      for i in elitismOffset..population.size 
        indiv1 = Evolution::Individual.tournamentSelection population
        indiv2 = Evolution::Individual.tournamentSelection population
        newIndiv = crossover indiv1, indiv1
        
        newPopulation.saveIndividual i, newIndiv
      end
      
      # Mutate the population
      for i in elitismOffset..newPopulation.size
        mutate newPopulation.getIndividual i
      end
      
      newPopulation
    end
    
    ## crossover
    # @param:
    # @return:
    def self.crossover indiv1, indiv2
      newSol = Evolution::Individual.new 0
      
      for i in 0..indiv1.size
        # Crossover
        if rand <= @uniformRate
          newSol.setGene i, indiv1.getGene(i)
        else
          newSol.setGene i, indiv2.getGene(i)
        end
      end
      
      newSol
    end
    
    ## mutate
    # @param:
    # @return:
    def self.mutate indiv
      for i in 0..indiv.size
        if rand <= @mutationRate
          gene = Random.rand(2)
          indiv.setGene i, gene
        end
      end
    end
    
    ## tournamentSelection
    # @param:
    # @return:
    def selftournamentSelection population
      tournament = Evolution::Population.new population, false
      
      for i in 0..@tournamentSize
        randomId = rand * population.size
        tournamentSize.saveIndividual i, population.getIndividual(randomId)
      end
      
      # Individual fittest = tournament.getFittest();
      tournamentSize.getFittest
    end
      
  end # class Algorithm
end # module Evolution