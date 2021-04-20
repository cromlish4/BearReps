class AddFieldToApps < ActiveRecord::Migration[6.0]
  def change
    add_column :Apps, :employed_status, :string, :default => "non_employed"

  end
end
