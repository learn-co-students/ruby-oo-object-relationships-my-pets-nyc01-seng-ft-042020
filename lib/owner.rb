#Overview
#You will be building an Owner, Dog, and Cat class. An Owner will know about all their pets, 
#be able to buy a pet, change a pet's mood through walking or feeding it, and sell all of their pets
# (for when they move to that tiny NYC studio after college).

# A Dog and a Cat are initialized with a name and an Owner object

# Part I: Object #Models
#Define a Dog and Cat class that have the attributes required by the test suite. Keep in mind, some of the 
#attributes should be readable and writable (i.e. attr_accessors), while others may need to be just setters 
#(attr_writer) or just getters (attr_reader). The test suite will make this clear so pay attention to the test output#.

#Part II: Object Relations
#An owner should be able to buy and sell a pet, which will change the pet's mood.

#When an owner buys a new pet, the buy_cat/buy_dog methods take in an argument of a name. You must take that 
#name and do the following:

#Make a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it.
#An owner should have the ability to walk all their dogs or feed all their cats, which will change the mood 
#of all of their pets of that type to "happy".

class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self 
  end 

  def say_species
    "I am a #{self.species}."
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
    pets = self.cats + self.dogs 
      pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 

end 


































# class Owner
#   attr_reader :name, :species     
#   @@all = []
#   def initialize(name)
#     @name = name 
#     @species = "human"
#     # @@all << self #this one is not recommended
#     Owner.all << self 
#     # self.save
#   end 


#   def say_species
#     "I am a #{self.species}."
#   end 
  
#   def self.all
#     @@all 
#   end 
# end

# def self.count
#   self.all.count
# end 

# def self.reset_all 
#   self.call.clear
# end 

# def buy_cat(cat_name)
#   Cat.new(cat_name, self)
# end 