class AddNumPostsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :num_posts, :integer, default: 0

    User.all.find_each do |u|
      u.num_posts.increment u.posts.count
    end
  end
end
