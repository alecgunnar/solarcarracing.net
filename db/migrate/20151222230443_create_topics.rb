class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.string :seo_name, null: false
      t.datetime :post_date, null: false
      t.integer :forum_id, null: false
      t.integer :user_id, null: false
      t.integer :num_posts, default: 1
      t.boolean :pinned, default: false
      t.boolean :closed, default: false
    end

    add_foreign_key :topics, :forums
    add_foreign_key :topics, :users

    add_index :topics, :forum_id
    add_index :topics, :user_id
  end
end
