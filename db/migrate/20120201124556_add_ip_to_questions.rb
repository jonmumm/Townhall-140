class AddIpToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :ip, :string
  end
  def self.down
    remove_column :questions, :ip
  end
end
