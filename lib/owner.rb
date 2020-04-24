class Owner
  attr_reader :name, :species
  @@all = []
def initialize(name)
  @name = name
  @species = "human"
  @@all << self
 end
 def say_species
  @species
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
    Dog.all.select do |doggie|
      doggie.owner ==self
  end
end
def buy_cat(kitty)
  Cat.new(kitty,self)
end
def buy_dog(doggy)
  Dog.new(doggy,self)
end
def walk_dogs
  # walks the dogs which makes the dogs' moods happy 
  self.dogs.each do |doggy|
    doggy.mood = "happy"
end
end
def feed_cats 
  self.cats.each do |kitty|
    kitty.mood = "happy" 
  end
end
def sell_pets
selling = self.dogs + self.cats
selling.each do |friends|
  friends.mood = "nervous"
  friends.owner = nil
end
end
def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

end
end