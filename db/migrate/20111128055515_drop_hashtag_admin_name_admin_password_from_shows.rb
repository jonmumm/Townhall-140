class DropHashtagAdminNameAdminPasswordFromShows < ActiveRecord::Migration
  def up
    remove_column :shows, :hashtag
    remove_column :shows, :admin_name
    remove_column :shows, :admin_password
  end

  def down
    add_column :shows, :hashtag, :string
    add_column :shows, :admin_name, :string
    add_column :shows, :admin_password, :string
  end
end
