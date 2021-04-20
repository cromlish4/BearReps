class CreateRecommendation < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :course
      t.integer :section

      t.timestamps
    end
  end
end
