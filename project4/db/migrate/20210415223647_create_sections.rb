class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.integer :classNumber, null: false
      t.string :meetingDays
      t.string :meetingTimes
      t.integer :waitlistTotal
      t.string :endDate
      t.string :startDate
      t.string :enrollmentStatus
      t.string :instructionMode
      t.string :component
      t.string :section
      t.integer :courseID, null: false

      t.timestamps
    end
  end
end
