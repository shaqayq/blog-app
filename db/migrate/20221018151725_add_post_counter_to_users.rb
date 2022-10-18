class AddPostCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :PostCounter, :integer
  end
end
