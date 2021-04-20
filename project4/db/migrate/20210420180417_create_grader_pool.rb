class CreateGraderPool < ActiveRecord::Migration[6.0]
  def change
    create_table :grader_pools do |t|
      t.string :nameDotNumber, null: false
      t.string :class, null: false
    end
  end
end
