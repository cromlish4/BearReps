class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.text :classes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
