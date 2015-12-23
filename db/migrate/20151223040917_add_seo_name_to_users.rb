class AddSeoNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seo_name, :string
    add_index :users, :seo_name, unique: true

    User.all.each do |u|
      u.update seo_name: u.id.to_s + '-' + u.username.downcase
    end
  end
end