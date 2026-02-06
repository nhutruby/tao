(0..1000).each do |i|
user1 = User.find_or_create_by(first_name: "Nick#{i.to_s}") do |user|
  user.last_name = 'Dual' + i.to_s
end
user2 = User.find_or_create_by(first_name: "Donald#{i.to_s}") do |user|
  user.last_name = 'Trump' + i.to_s
end

assoc_friend = Friend.add_friend({ id1: user1._id.to_s, id2: user2._id.to_s })
end