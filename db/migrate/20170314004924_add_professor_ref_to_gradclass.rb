class AddProfessorRefToGradclass < ActiveRecord::Migration
  def change
    add_reference :gradclasses, :professor, index: true, foreign_key: true
  end
end
