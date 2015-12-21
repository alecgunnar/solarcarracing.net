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
category.name = "Default Category"
category.save!

forum             = Forum.new
forum.name        = "Default Forum"
forum.description = "Default discussion forum."
forum.category    = category
forum.save!
