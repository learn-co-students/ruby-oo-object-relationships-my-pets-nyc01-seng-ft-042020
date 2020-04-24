class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood

  @@all_dogs = []
  def initialize (name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all_dogs << self
  end

  def self.all
    @@all_dogs
  end
end