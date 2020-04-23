require 'pry'

class Owner
  # code goes herelearn
  attr_reader :name, :species
  @@all = []
  def initialize(name)
  @name = name
  @species = "human"
  Owner.all << self
  end

  def say_species 
    "I am a #{@species}."
  end

  def self.all
  @@all 
  end 

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
    end 
    # using instance methods on new variable
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

    
