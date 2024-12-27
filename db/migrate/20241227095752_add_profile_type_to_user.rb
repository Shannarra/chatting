class AddProfileTypeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :profile_type, :integer, default: 0
  end
end
