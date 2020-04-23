class Cat
  # code goes here

  attr_accessor :owner, :mood
  attr_reader :name

  @@cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    Cat.all << self
  end

  def self.all
    @@cats
  end

end