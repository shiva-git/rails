class CreateGradClasses < ActiveRecord::Migration
  def change
    create_table :grad_classes do |t|
      t.string :name
      t.time :startTime
      t.time :endTime
      t.integer :maximumStudents
      t.timestamps null: false
    end
  end
end
