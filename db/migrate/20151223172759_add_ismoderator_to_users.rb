class AddIsmoderatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_moderator, :boolean, default: false

    User.all.update_all is_moderator: false
  end
end
