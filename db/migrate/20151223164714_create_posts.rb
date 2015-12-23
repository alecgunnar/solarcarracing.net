class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :topic_id, null: false
      t.integer :user_id, null: false
      t.datetime :post_date, null: false
      t.text :content
      t.boolean :edited, default: false
      t.datetime :edit_date, null: true, default: nil
    end
  end
end
