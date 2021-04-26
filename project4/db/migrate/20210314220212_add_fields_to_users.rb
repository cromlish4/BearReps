class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :text
    add_column :users, :lname, :text
    add_column :users, :nameDotNumber, :text, unique: true
    add_column :users, :year, :text
    add_column :users, :user_type, :text
    add_column :users, :verified, :text, :default => "false"
  end
end
