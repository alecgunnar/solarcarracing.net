# Root user account
root                       = User.new
root.username              = 'Root'
root.email                 = 'root@domain.com'
root.password              = '$iamroot'
root.password_confirmation = '$iamroot'
root.skip_confirmation!
root.save!

# Default forums
category      = Forum.new
category.name = "Welcome to SolarCarRacing.net"
category.save!

forum             = Forum.new
forum.name        = "Discussion"
forum.description = "Start discussing whatever, here!"
forum.category    = category
forum.save!

# Welcome topic
topic        = Topic.new
topic.name   = "You've Done It!"
topic.forum  = forum
topic.author = root
topic.save!
