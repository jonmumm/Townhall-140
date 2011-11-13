class ChangeTitleToHashTagFromShows < ActiveRecord::Migration
  def change
    rename_column :shows, :title, :hashtag
  end
end
