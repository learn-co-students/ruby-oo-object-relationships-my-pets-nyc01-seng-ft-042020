class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    # @@all << self
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

#owner.cats
  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each { |dog_instance| dog_instance.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat_instance| cat_instance.mood = "happy" } 
  end

  def sell_pets
    dogs.each { |dog_instance| dog_instance.mood = "nervous" }
    dogs.each { |dog_instance| dog_instance.owner = nil }
    cats.each { |cat_instance| cat_instance.mood = "nervous" }
    cats.each { |cat_instance| cat_instance.owner = nil }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  # def self.all_pets
  #   ["Tashawn", "James"]
  #   self.all.each do |owner|
  #     owner.pets
  #   end
  # end

end
