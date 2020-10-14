class Cult

@@all = []

def self.all
    @@all
end

def self.find_by_name(name)
    self.all.find{|cult| cult.name == name}
end

def self.find_by_location(location)
    self.all.select{|cult| cult.location == location}
end

def self.find_by_founding_year(founding_year)
    self.all.select{|cult| cult.founding_year == founding_year}
end

def self.least_popular
    least_followers = nil
    cult_w_least = nil
    cult_w_least_arr = []

self.all.each do |cult|

        if cult_w_least_arr.length == 0
            least_followers = cult.followers.length
            cult_w_least = cult
            cult_w_least_arr = [cult]

        elsif cult.followers.length < least_followers
            least_followers = cult.followers.length
            cult_w_least = cult
            cult_w_least_arr = [cult]

        elsif cult.followers.length == least_followers
            cult_w_least_arr << cult
        end
    end
    return cult_w_least_arr
end

def self.locations
    self.all.map {|cult| cult.location}
end

def self.most_common_location
    location_hash = {}
    locations.each do |location|
        if !location_hash.key?(location)
            location_hash[location] = 1
        else
            location_hash[location] += 1
        end
    end
    max_count = 0
    location_w_max = nil
    location_hash.each do |key, value|
        if value > max_count
            max_count = value
            location_w_max = key
        end
    end
    return location_w_max
end


attr_accessor :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(initiation_date, follower)
        Blood_oath.new(initiation_date, self, follower)
    end

    def cult_population
        Blood_oath.all.select {|oath| oath.cult == self}.count
    end

    def followers
        arr = Blood_oath.all.select {|oath| oath.cult == self}
        arr.map {|oath| oath.follower}
    end


    def average_age
        followers.map {|follower| follower.age}.sum.to_f / followers.size
    end

    def my_followers_mottos
       followers.collect {|follower| p follower.life_motto}
    end

    
        
    
end