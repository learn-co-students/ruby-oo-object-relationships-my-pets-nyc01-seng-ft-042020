class Dog
  attr_reader :name
  attr_accessor :owner, :mood

  @@dogs = []

  def initialize (name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.save
  end

  def save
    @@dogs << self
  end

  def self.all
    @@dogs
  end
  
end