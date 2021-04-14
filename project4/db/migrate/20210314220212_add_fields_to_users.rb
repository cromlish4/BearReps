class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :nameDotNumber, :string, unique: true
    add_column :users, :year, :string
    add_column :users, :user_type, :string
    add_column :users, :verified, :string, :default => "false"
  end
end
