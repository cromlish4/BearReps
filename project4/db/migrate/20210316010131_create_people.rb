class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.text :fname
      t.text :lname
      t.text :dot
      t.text :year
      t.text :username
      t.text :password

      t.timestamps
    end
  end
end
