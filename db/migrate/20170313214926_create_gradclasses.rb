class CreateGradclasses < ActiveRecord::Migration
  def change
    create_table :gradclasses do |t|
      t.string :name , unique: true
      t.time :startTime
      t.time :endTime
      t.integer :maximumStudents
      t.timestamps null: false
    end
  end
end
