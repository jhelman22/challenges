# https://www.reddit.com/r/dailyprogrammer/comments/5b5fc8/20161104_challenge_290_hard_gophers_and_robot_dogs/

# INPUT FILE
input = "reddit_dailyprogrammer/290/hard2.txt"
lines = File.readlines(input)

dog = lines[0].split(" ")
dog_x = dog[0].to_f
dog_y = dog[1].to_f
dog_v = dog[2].to_f

gopher = lines[1].split(" ")
gopher_x = gopher[0].to_f
gopher_y = gopher[1].to_f
gopher_v = gopher[2].to_f

holes = lines[3..-1]

# find nearest hole to gopher
distances = []
holes.each do |hole|
  h = hole.split(" ")
  h_x = h[0].to_f
  h_y = h[1].to_f
  distances.push(Math.sqrt((h_x - gopher_x)**2 + (h_y - gopher_y)**2))
end
nearest_hole = distances.index(distances.min)
nh = holes[nearest_hole].split(" ")
nh_x = nh[0].to_f
nh_y = nh[1].to_f

# vector from dog to gopher
ox = dog_x - gopher_x
oy = dog_y - gopher_y

# gopher velocity
vx = nh_x - gopher_x
vy = nh_y - gopher_y
vx = gopher_v * vx / (Math.sqrt(vx**2 + vy**2))
vy = gopher_v * vy / (Math.sqrt(vx**2 + vy**2))

# solve interception
h1 = vx**2 + vy**2 - dog_v**2
h2 = ox * vx + oy * vy
h3 = ox**2 + oy**2
p2 = Math.sqrt((h2/h1)**2 - h3 / h1)
p1 = h2 / h1
t1 = p1 + p2
t2 = p1 - p2
tmax = Math.sqrt((nh_x-gopher_x)**2 + (nh_y-gopher_y)**2) / gopher_v

if t1 >= 0 && t1 <= tmax
  puts "#{gopher_x + vx * t1}, #{gopher_y + vy * t1}"
elsif t2 >= 0 && t2 <= tmax
  puts "#{gopher_x + vx * t2}, #{gopher_y * vy * t2}"
else
  puts "No solution"
end
