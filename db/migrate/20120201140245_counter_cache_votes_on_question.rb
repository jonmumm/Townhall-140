class CounterCacheVotesOnQuestion < ActiveRecord::Migration
  def up
    add_column :questions, :votes_count, :integer, :default => 0
  end

  def down
    remove_column :questions, :votes_count
  end
end
