class AddProfessorNameToGradClass < ActiveRecord::Migration
  def change
    add_column :grad_classes, :professorName, :string
  end
end
