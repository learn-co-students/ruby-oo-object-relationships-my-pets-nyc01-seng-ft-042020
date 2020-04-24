class Cat

  attr_reader :name
  attr_accessor :owner, :mood

  @@all_cats = []
  # code goes here
  def initialize (name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all_cats << self
  end

  def self.all
    @@all_cats
  end
end