fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)

  fish.each_with_index do |f1,idx1|
    max = true
    fish.each_with_index do |f2,idx2|
      next if idx1 == idx2
      max = false if f2.length > f1.length
    end
    return f1 if max
  end

end

def dominant_octopus(fish)
  dominant_octopus_helper(fish)
end

def dominant_octopus_helper(fish)
  #using quicksort
  return fish[0] if fish.length == 1
  return [] if fish.empty?
  left = dominant_octopus_helper(fish[1..-1].select{|f| f.length <= fish[0].length})
  right = dominant_octopus_helper(fish[1..-1].reject{|f| f.length <= fish[0].length})
  left+fish[0]+right
end

def clever_octopus(fish)
  longest = fish[0]

  fish.each do |f|
    longest = f if longest.length < f.length
  end
  longest
end

#Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(direction,tiles_array)
  tiles_array.each_with_index do |tile,idx|
    return idx if tile == direction
  end
end

tiles_array_new = {"up"=>0, "right-up"=>1, "right" =>2,"right-down"=>3,
  "down"=>4,"left-down"=>5, "left"=>6,  "left-up" =>7}
def fast_dance(direction,tiles_array_new)
  tiles_array_new[direction]
end
