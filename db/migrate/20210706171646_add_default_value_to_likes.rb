class AddDefaultValueToLikes < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :likes, :integer, :default => 0, :null => false
  end
end
