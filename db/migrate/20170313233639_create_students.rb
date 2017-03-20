class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :year
      t.integer :ssn , unique: true
      t.timestamps null: false
    end
  end
end
