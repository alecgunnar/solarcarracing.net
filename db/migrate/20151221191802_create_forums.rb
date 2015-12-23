class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.string :seo_name, limit: 64, null: true, default: nil
      t.string :description
      t.integer :num_topics, default: 0
      t.integer :num_posts, default: 0
      t.integer :last_post_id, default: 0
      t.integer :parent_id, index: true, null: true, default: nil
    end

    add_foreign_key :forums, :forums, column: :parent_id

    add_index :forums, :seo_name, unique: true
  end
end
