user1 = User.find_or_create_by(first_name: 'Nick') do |user|
  user.last_name = 'Dual'
end
user2 = User.find_or_create_by(first_name: 'Donald') do |user|
  user.last_name = 'Trump'
end

assoc_friend = Friend.add_friend({ id1: user1._id.to_s, id2: user2._id.to_s })
