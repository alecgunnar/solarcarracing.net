class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.string :description
      t.integer :topics, default: 0
      t.integer :posts, default: 0
      t.integer :last_post_id, default: 0
      t.integer :parent_id, index: true, default: 0
      t.timestamps null: false
    end
  end
end
