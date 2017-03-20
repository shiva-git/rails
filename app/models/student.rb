class Student < ActiveRecord::Base
    
  has_and_belongs_to_many :gradclasses,:uniq => true
  
  def self.get_student_id(ssn_no)
      
      student_id = Student.find_by ssn: ssn_no
      return student_id
      
  end
end
