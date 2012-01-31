class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :ip                      # remote ip address
      t.integer :user_id, null: true    # may be anonymous 
      t.integer :question_id, null: false
      t.datetime :created_at
    end
  end
end
