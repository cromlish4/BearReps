class CreatePool < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.string :nameDotNumber, null: false, unique: true
      t.string :class, null: false
    end
  end
end
