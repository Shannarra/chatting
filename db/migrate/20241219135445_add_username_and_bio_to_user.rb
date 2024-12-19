class AddUsernameAndBioToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, default: 'Unknown'
    add_column :users, :bio, :string, default: ''
  end
end
