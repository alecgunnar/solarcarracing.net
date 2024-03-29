# Root user account
root                       = User.new
root.username              = 'Root'
root.email                 = 'root@domain.com'
root.password              = '$iamroot'
root.password_confirmation = '$iamroot'
root.is_admin              = true
root.is_moderator          = true
root.skip_confirmation!
root.save

# Default forums
category      = Forum.new
category.name = 'Welcome to SolarCarRacing.net'
category.save

forum             = Forum.new
forum.name        = 'Discussion'
forum.description = 'Start discussing whatever, here!'
forum.category    = category
forum.save

# Welcome topic
topic        = Topic.new
topic.name   = 'You\'ve Done It!'
topic.forum  = forum
topic.author = root
topic.save

post          = Post.new
post.topic    = topic
post.author   = root
post.content  = 'You have successfully installed SolarCarRacing.net, congrats!'
post.is_first = true
post.save
