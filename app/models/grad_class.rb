class GradClass < ActiveRecord::Base
  
  has_and_belongs_to_many :Students
  belongs_to :professor

end
