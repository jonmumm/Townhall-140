class AddAuthorStringToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :author, :string
  end
  def down
    remove_column :questions, :author
  end
end
