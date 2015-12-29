class AddIsFirstToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_first, :boolean, default: false

    Topic.find_each do |t|
      p = Post.where('topic_id = ?', t.id).order('post_date ASC').first
      p.update is_first: true
    end
  end
end
