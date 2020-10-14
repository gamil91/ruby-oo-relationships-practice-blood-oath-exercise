class Follower

@@all = []

def self.all
    @@all
end

def self.of_a_certain_age(age)
    self.all.select {|follower| follower.age >= age}
end

attr_accessor :name, :age, :life_motto

def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
end

def cults
   blood_oaths =  Blood_oath.all.select{|oath| oath.follower == self}
   blood_oaths.map {|oath| oath.cult}
end

def join_cult(initiation_date, cult)
    Blood_oath.new(initiation_date, cult, self)
end

def my_cults_slogans
    self.cults.map{|cult|cult.slogan}
    
end


end