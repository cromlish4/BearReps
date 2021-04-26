class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.integer :classNumber, null: false, unique: true
      t.text :meetingDays
      t.text :meetingTimes
      t.integer :waitlistTotal
      t.text :endDate
      t.text :startDate
      t.text :enrollmentStatus
      t.text :instructionMode
      t.text :component
      t.text :section
      t.integer :courseID, null: false

      t.timestamps
    end
  end
end
