user1 = User.find_or_create_by(first_name: "Nick") do |user|
  user.last_name = 'Dual'
end
(0..1000).each do |i|
user2 = User.find_or_create_by(first_name: "Donald#{i}") do |user|
  user.last_name = 'Trump' + i.to_s
end

assoc_friend = Friend.add_friend({ id1: user1._id.to_s, id2: user2._id.to_s })
end
