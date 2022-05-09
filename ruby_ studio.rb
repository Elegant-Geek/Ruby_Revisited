#welcome 8:24pm on 5/8/22
#ACCOUNTS FOR LEARNING DONE IN RUBY MODULES 1-6
#EXPIRED/OLD FILE, USE SONGFILE.RB
greeting = "Welcome!"
3.times do
  puts greeting.upcase
end

#puts Time.now.strftime("The time is %-I:%M %p.") 

def time
    current_time = Time.new
    formatted_time = current_time.strftime("%A %m/%d/%Y at %-I:%M %p")
end
def time_simplified
    current_time = Time.new
    current_time.strftime("%-I:%M %p")
end
def say_hello(name, health=100)
"I'm #{name.capitalize} with a health of #{health} as of #{time_simplified}."
end


puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
puts "The game started on #{time}"
