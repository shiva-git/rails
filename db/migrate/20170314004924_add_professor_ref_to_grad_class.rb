class AddProfessorRefToGradClass < ActiveRecord::Migration
  def change
    add_reference :grad_classes, :professor, index: true, foreign_key: true
  end
end
