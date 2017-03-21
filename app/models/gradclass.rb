class Gradclass < ActiveRecord::Base
  
    has_and_belongs_to_many :students
    belongs_to :professor
  
  
    def self.class_professor(classname)
      grad_class = Gradclass.find_by name: classname
      profname = grad_class.professor.name 
      
      return profname
    end
    
    def self.class_allStudents(gradclass)
      studentsarray = []
      studentslist = Hash.new()
      studentsarray = gradclass.students
      studentsarray.each { |student|  studentslist[student.ssn] = student.name }
      
      return studentslist
    end
    
    def self.get_class_id(classname)
      gradclass=Gradclass.find_by name: classname
      
      return gradclass
    end

end
