require 'pry'

class Owner
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
    Cat.all.select do |cat|
      cat.owner == self
      #returns and array of all of the cats that belong to the owner
    end
  end 
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
      #returns and array of all of the dogs that belong to the owner
    end
  end
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
    #creates a new instance of dog with self as the owner 
    #this new dog will now be in the array of dogs that belong to this owner
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
    #sells the pets - makes then nervous and then leaves them without owner
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
    
    # pets_array = []
    # pets_array << self.dogs
    # pets_array << self.cats
    # pets_array.flatten
  end
end

