class Owner
  # code goes here
@@all = []
attr_reader :name, :species

def initialize(name)
  @name = name
  @species = "human"
  Owner.all << self
end

def self.all
  @@all
end

def say_species
  "I am a #{@species}."
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

def buy_cat(name_of_cat)
  Cat.new(name_of_cat,self)
end

def buy_dog(name_of_dog)
  Dog.new(name_of_dog, self)
end

def self.count
  self.all.count
end

def self.reset_all
self.all.clear
end

def walk_dogs
# self.dogs.each do |dog|
#   dog.mood = "happy"
# end
Dog.all.each do |dog|
  dog.mood = "happy"
end
end

def feed_cats
  self.cats.each do |cat|
    cat.mood = "happy"
  end
end

def sell_pets
  self.cats.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end
  self.dogs.each do |dog|
    dog.mood = "nervous"
    dog.owner = nil
  end
end


def list_pets
"I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end