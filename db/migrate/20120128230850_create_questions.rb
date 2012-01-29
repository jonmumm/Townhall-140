class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :body
      t.integer :user_id
      t.integer :show_id
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
