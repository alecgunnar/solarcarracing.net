root                       = User.new
root.email                 = 'root@domain.com'
root.password              = '$iamroot'
root.password_confirmation = '$iamroot'
root.skip_confirmation!
root.save!
