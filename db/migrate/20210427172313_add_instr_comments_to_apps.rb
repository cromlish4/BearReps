class AddInstrCommentsToApps < ActiveRecord::Migration[6.0]
  def change
    add_column :apps, :instr_comments, :text
  end
end
