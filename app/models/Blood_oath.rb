class Blood_oath

    @@all = []

    def self.all
        @@all
    end

attr_reader :initiation_date
attr_accessor :cult, :follower

def initialize(initiation_date, cult, follower)
 @cult = cult
 @@all << self
 @follower = follower
 @initiation_date = initiation_date
end




end