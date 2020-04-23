class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name, species='human')
    @name = name
    @species = species
    Owner.all << self
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

  def say_species
    p "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    my_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    my_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
   self.dogs.each do |pet|
     pet.mood = 'nervous'
     pet.owner = nil
   end
   self.cats.each do |pet|
     pet.mood = 'nervous'
     pet.owner = nil
    end
   end

    def list_pets
     p "I have #{self.dogs.count} dog(s), and #{self.dogs.count} cat(s)."
    end 
  end
