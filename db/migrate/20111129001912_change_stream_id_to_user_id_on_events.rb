class ChangeStreamIdToUserIdOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :stream_id, :user_id
  end
end
