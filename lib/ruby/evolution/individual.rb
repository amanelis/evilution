module Evolution
  class Individual    
    #
    # instance variables
    attr_accessor :defaultGeneLength
    attr_accessor :genes
    attr_accessor :fitness
    
    ## initialize
    # @param: Integer[arraySize]
    # @return:
    # setup our instance variables
    def initialize arraySize
      @defaultGeneLength = 64
      @genes = Array.new(arraySize, 0)
      @fitness = 0
    end
    
    ## generateIndividual
    # @param:
    # @return:
    def generateIndividual 
      for i in 0..size
        gene = Random.rand(2)
        @genes[i] = gene
      end
    end
    
    ## setDefaultGeneLength
    # @param:
    # @return:
    def setDefaultGeneLength length
      @defaultGeneLength = length
    end
    
    ### Getter methods
    ## size
    # @param:
    # @return: Integer
    # Just returns the size of the instance array for @genes
    def size
      @genes.size
    end
    
    ## getGene
    # @param:
    # @return: Integer
    # Returns an element at any index of the @genes array
    def getGene index
      @genes[index]
    end
    
    ## setGene
    # @param: Integer[index]
    # @param: Ingeter[gene]
    # @return:
    # Sets an index value to a new gene
    def setGene index, gene
      @genes[index] = gene
    end
    
    ## getFitness
    # @param:
    # @return:
    # Return the Fitness level of the gene
    def getFitness
      fitness == 0 ? FitnessCalc.getFitness(self) : fitness
    end
    
    # @Override
    ## to_s
    # @param:
    # @return: String
    # Simply computes a string representation of the gene
    def to_s
      @genes.inject("") { |s, x| s.concat x }
    end
    
  end
end