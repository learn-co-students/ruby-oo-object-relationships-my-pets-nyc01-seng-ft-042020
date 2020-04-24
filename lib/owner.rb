# Instance methods
# #name
#   can have a name (FAILED - 1)
#   cannot change owner's name (FAILED - 2)
# #species
#   initializes with species set to human (FAILED - 3)
#   can't change its species (FAILED - 4)
# #say_species
#   can say its species (FAILED - 5)
# Class methods
# .all returns all instances of Owner that have been created (FAILED - 6)
# .count returns the number of owners that have been created (FAILED - 7)
# .reset_all can reset the owners that have been created (FAILED - 8)
require "pry"

class Owner

  attr_reader :name, :species

  @@all = []

    def initialize (name)
      @name = name
      @species = "human"
      save
    end

    def say_species
      "I am a #{@species}."
    end

    def save 
      @@all << self
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

# Owner instance methods
# #cats
#   returnsa a collection of all the cats that belong to the owner (FAILED - 13)
# #dogs
#   returnsa a collection of all the dogs that belong to the owner (FAILED - 14)
# #buy_cat
#   can buy a cat that is an instance of the Cat class (FAILED - 15)
#   knows about its cats (FAILED - 16)
# #buy_dog
#   can buy a dog that is an instance of the Dog class (FAILED - 17)
#   knows about its dogs (FAILED - 18)
# #walk_dogs
#   walks the dogs which makes the dogs' moods happy (FAILED - 19)
# #feed_cats
#   feeds cats which makes the cats' moods happy (FAILED - 20)
# #sell_pets
#   can sell all its pets, which makes them nervous (FAILED - 21)
#   can sell all its pets, which leaves them without an owner (FAILED - 22)
# #list_pets
#   can list off its pets (FAILED - 23)

    def cats
      #loop through .all class method for the class Cat
      #select the value for variable cat and return it to a new array
      #every time cat.owner == self is true
      Cat.all.select do |cat|
  #block determines true value
        cat.owner == self #returns if true
      end
    end

    def dogs
      Dog.all.select do |dog|
        dog.owner == self 
      end
    end

    #passes through argument cat_name to Cat.new while labeling self as owner
    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
    end

    def walk_dogs
      dogs.each do |dog|
        # binding.pry
        dog.mood = "happy"
      end
    end

    def feed_cats
      cats.each do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets
      dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end

      cats.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."


    end


end