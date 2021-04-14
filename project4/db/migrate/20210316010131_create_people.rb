class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :fname
      t.string :lname
      t.string :dot
      t.string :year
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
