class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.date :year
      t.integer :ssn

      t.timestamps null: false
    end
  end
end
