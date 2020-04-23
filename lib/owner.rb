require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize (name = nil)
    @name = name
    @species = "human"
    self.save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all 
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
   Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    #access dog's mood and update mood
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|cat| cat.owner = nil}
  end

  def list_pets
   number_of_cats = self.cats.count
   number_of_dogs = self.dogs.count
   return "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end

  # binding.pry

end