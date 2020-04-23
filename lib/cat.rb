class Cat
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name
  @@all = []
  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    Cat.all << self
  end

  def self.all
    @@all
  end

end