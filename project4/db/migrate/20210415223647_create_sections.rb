class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.integer :classNumber
      t.string :meetings
      t.string :campus
      t.integer :waitlistTotal
      t.string :term
      t.string :endDate
      t.string :startDate
      t.string :enrollmentStatus
      t.string :instructionMode
      t.string :component
      t.string :section

      t.timestamps
    end
  end
end
