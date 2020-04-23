require 'pry'
class Owner
  # code goes here

  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    end

    def say_species
      return "I am a #{@species}."
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
      Dog.all.select do |dog|
        dog.mood = "happy"
      end
    end

    def feed_cats
      Cat.all.select do |cat|
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