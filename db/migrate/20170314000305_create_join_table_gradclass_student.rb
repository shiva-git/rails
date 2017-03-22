class CreateJoinTableGradclassStudent < ActiveRecord::Migration
  def change
    create_join_table :gradclasses, :students do |t|
       t.index [:gradclass_id, :student_id] ,:unique => true
      t.index [:student_id, :gradclass_id] ,:unique => true
    end
  end
end
