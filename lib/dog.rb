# Dog
#   Instance methods
#     initializes with a name and an Owner (FAILED - 7)
#     can change its owner (FAILED - 8)
#     can't change its name (FAILED - 9)
#     initializes with a nervous mood (FAILED - 10)
#     can change its mood (FAILED - 11)
#   Class methods
#     knows all the dogs (FAILED - 12)




class Dog

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