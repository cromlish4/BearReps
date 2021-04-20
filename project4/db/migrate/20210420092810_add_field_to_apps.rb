class AddFieldToApps < ActiveRecord::Migration[6.0]
  def change
    add_column :Apps, :employed_status, :string, :default => "non_employed"
    add_column :Apps, :assigned, :string, :default => "unassigned"
    add_column :Apps, :assigned_class, :string, :default => "unassigned"
  end
end
