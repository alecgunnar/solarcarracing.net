class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.string :seo_name, null: false
      t.string :description
      t.integer :num_topics, default: 0
      t.integer :num_posts, default: 0
      t.integer :last_post_id, null: true, default: nil
      t.integer :parent_id, index: true, null: true, default: nil
    end

    add_foreign_key :forums, :forums, column: :parent_id
  end
end
