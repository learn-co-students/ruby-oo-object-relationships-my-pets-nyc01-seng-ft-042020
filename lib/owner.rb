class Owner
  # code goes here
  @@all=[]
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = 'human'

    Owner.all<<self
  end
  def say_species
    "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    Owner.all.count
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

  def buy_cat(catName)
    Cat.new(catName,self)
  end

  def buy_dog(dogName)
    Dog.new(dogName,self)
  end

  def walk_dogs
    myDogs = dogs
    myDogs.length.times do |i|
      myDogs[i].mood = "happy"
    end
  end

  def feed_cats
    myCats = cats
    myCats.length.times do |i|
      myCats[i].mood = "happy"
    end
  end

  def sell_pets
    myPets = dogs + cats
    myPets.length.times do |i|
      myPets[i].mood = "nervous"
      myPets[i].owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end