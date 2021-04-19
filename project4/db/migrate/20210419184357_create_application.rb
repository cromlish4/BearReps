class CreateApplication < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :applicant
      t.string :email
      t.string :course
      t.integer :section

      t.timestamps
    end
  end
end
