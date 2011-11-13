class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :show_id
      t.string :stream_id
      t.string :state

      t.timestamps
    end
  end
end
