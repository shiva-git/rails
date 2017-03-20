class CreateJoinTableGradclassStudent < ActiveRecord::Migration
  def change
    create_join_table :gradclasses, :students do |t|
       t.index [:gradclass_id, :student_id]
      t.index [:student_id, :gradclass_id]
    end
  end
end
