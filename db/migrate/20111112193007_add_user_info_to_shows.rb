class AddUserInfoToShows < ActiveRecord::Migration
  def change
    add_column :shows, :admin_name, :string
    add_column :shows, :admin_password, :string
    remove_column :shows, :user_id
  end
end
