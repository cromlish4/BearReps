class CreateRecommendation < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.text :name
      t.text :course
      t.integer :section

      t.timestamps
    end
  end
end
