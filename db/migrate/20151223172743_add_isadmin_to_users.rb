class AddIsadminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false

    User.all.update_all is_admin: false
  end
end
