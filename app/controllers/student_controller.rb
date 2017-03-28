class StudentController < ApplicationController
    
    
    def displayfindProfessorsForm
        
    end
    
    def displayfindClassesForm
        
    end
    
    def displayfindClassmatesForm
        
    end
    
    def findProfessors
        render json: (Student.student_allProfessors(params))
    end
    
    def findClasses
        render json: (Student.student_allClasses(params))
    end
    
    def findClassmates
        render json: ( Student.student_allClassmates(params) )
    end
    
    def findUnregisteredClasses
        render json: Student.getUnregisteredClasses
    end
end
