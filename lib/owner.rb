class Owner
  # code goes here
  attr_accessor :cats, :dogs, :mood
  attr_reader :species, :name

  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self

  end

  def self.all
    @@owners
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@owners
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end
  
  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def cats
    Cat.all.select {|kitty| kitty.owner == self}

  end

  def dogs
    Dog.all.select {|pup| pup.owner == self}

  end

  def walk_dogs
    Dog.all.each do |doggie|
      if doggie.owner == self
        doggie.mood = "happy"
      end
    end
  end


  def feed_cats
    Cat.all.each do |kitty|
      if kitty.owner == self
        kitty.mood = "happy"
      end
    end
  end


  def sell_pets
    Cat.all.each do |kitty|
      if kitty.owner == self
        kitty.mood = "nervous"
        kitty.owner = nil
      end
    end
    Dog.all.each do |doggie|
      if doggie.owner == self
        doggie.mood = "nervous"
        doggie.owner = nil
      end
    end
  end


  def list_pets
    dog_count = Dog.all.count {|pup| pup.owner == self}
    cat_count = Cat.all.count {|kitty| kitty.owner == self}
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end






end