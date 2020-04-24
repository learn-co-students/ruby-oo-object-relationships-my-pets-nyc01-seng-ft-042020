# Cat
#   Instance methods
#     initializes with a name and an Owner (FAILED - 1)
#     can change its owner (FAILED - 2)
#     can't change its name (FAILED - 3)
#     initializes with a nervous mood (FAILED - 4)
#     can change its mood (FAILED - 5)
#   Class methods
#     knows all the cats (FAILED - 6)

class Cat
 
attr_accessor :owner, :mood
attr_reader :name

@@all = []

  def initialize (name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end











end