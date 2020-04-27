class Cat

    attr_reader :name
    attr_accessor :owner, :mood
  
    @@cats=[]
  
  def initialize(name,owner,mood="nervous")
    @name=name
    @owner=owner
    @mood=mood
    @@cats << self
    
  end
  
  def self.all
    @@cats
  end
  
  
  
  end
  

