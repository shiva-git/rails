class Student < ActiveRecord::Base
    
  has_and_belongs_to_many :gradclasses,:uniq => true
  
  def self.get_student_id(ssn_no)
      
      student_id = Student.find_by ssn: ssn_no
      return student_id
      
  end
  
  
  def self.student_allProfessors(student)
    classarray =[]
    professorarray =[]
    
    classarray = student.gradclasses
    classarray.each {|gradclass| puts gradclass.professor_id ,professorarray << gradclass.professor.name}
    return professorarray
  
  end
  
  def self.student_allClasses(student)
    classarray =[]
    studentclasses=[]
    
    classarray = student.gradclasses
    classarray.each {|gradclass| studentclasses << gradclass.name}
    return studentclasses
  
  end
end
