class AddStartTimeToShows < ActiveRecord::Migration
  def change
    add_column :shows, :start_time, :datetime
  end
end
