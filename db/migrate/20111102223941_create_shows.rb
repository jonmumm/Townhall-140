class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :archive_id
      t.string :session_id
      t.integer :user_id

      t.timestamps
    end
  end
end
