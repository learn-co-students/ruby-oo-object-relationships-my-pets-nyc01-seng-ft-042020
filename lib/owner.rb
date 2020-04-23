class Owner
  attr_reader :name, :species     
  @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    # @@all << self #this one is not recommended
    Owner.all << self 
    # self.save
  end 


  def say_species
    "I am a #{self.species}."
  end 
  
  def self.all
    @@all 
  end 
end

def self.count
  self.all.count
end 

def self.reset_all 
  self.call.clear
end 

def buy_cat(cat_name)
  Cat.new(cat_name, self)
end 