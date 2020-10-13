require_relative '../config/environment.rb'
require_relative '../app/models/Blood_oath'
require_relative '../app/models/Cult'
require_relative '../app/models/Follower'

def reload
  load 'config/environment.rb'
end

jjj = Cult.new("jjj", "Guyana", 1955, "color")
cult1 = Cult.new("hhh", "Guyana", 1955, "color")
cult2 = Cult.new("lll", "Guyana2", 1956, "color1")
cult3 = Cult.new("iii", "Guabano", 1924, "color2")
cult4 = Cult.new("aaa", "Guabano1", 1999, "color3")

michael = Follower.new("Michael", 15, "don't think, DO!")
alex = Follower.new("Alex", 7, "Just Do IT!")

jjj.recruit_follower("2020-10-13", michael)
cult2.recruit_follower("2020-10-13", michael)
jjj.recruit_follower("2020-10-13", alex)

puts jjj.cult_population

Cult.find_by_name('jjj')
Cult.find_by_location("Guyana")
michael.cults
alex.join_cult("2020-10-13", cult2)
alex.cults

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits