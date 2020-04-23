require 'pry'
class Owner
  #code goes here
  attr_reader :name, :species

  @@all_names = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self #@@all << name #self.save using save helper method
  end

  def say_species
    "I am a #{@species}."##{self.species} works as welll
  end

  def self.all
    @@all_names
  end

  def self.count
    Owner.all.count #can use self.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select do |cat| 
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end