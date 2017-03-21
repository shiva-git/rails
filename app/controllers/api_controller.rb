class ApiController < ApplicationController
   
    
    def home
    end
    
    def displayClassForm
        
    end
    
    def create
        #pid = Professor.create(professor_params)
        #Gradclass.create(gradclass_params(pid))
        
        professor = Professor.create({"name" => params[:professorName]})
        professor.gradclasses.create({"name" => params[:name] , "startTime" => params[:startTime] ,"endTime" => params[:endTime],"maximumStudents" => params[:maximumStudents]})
        
        render json: params
    end
    
    def classdetails
        
        render json: ( Gradclass.find_by name: params[:id] )
    
    end
    
    def displayfindStudentsForm
        
        
    end
    
    def allStudents
        
        gradclass = Gradclass.find_by name: params[:name]
        render json: ( Gradclass.class_allStudents(gradclass) )
        
    end
    
    def prof
        
        render json: ( Gradclass.class_professor(params[:id]) )
    
    end
    
    def displayRegisterForm
        #render json: params
        @gradclassname = params[:id]
        
    end
    
    def register
        
        gradclass = Gradclass.get_class_id(params[:id])
        
        if(Student.where(:ssn => params[:ssn]).exists?)
            student = Student.find_by ssn: params[:ssn]
            
            student_id =student.id
            gradclass_id = gradclass.id
            
            sql = "INSERT INTO gradclasses_students VALUES
            (#{gradclass_id}, #{student_id});"
            
            ActiveRecord::Base.connection.execute(sql)
            
        else
            gradclass.students.create(studentclass_params)
            
        end
        
        #gradclass.students.create(studentclass_params)
        #class_id = Gradclass.get_class_id(params[:id])
        #sid = Student.create(studentclass_params)
        #class_id = Gradclass.get_class_id(params[:id])
        #test123 = Gradclass.find(class_id)
        #render json: test123
        # puts sid
        # puts class_id
        #GradclassesStudents.create(gradclasses_students_params(class_id,sid));
        
        #gradclasses_students_params(class_id,sid)
        #gradclasses_students.create(gradclasses_students_params(class_id,sid))
        
        render json: params

    end
    
    def displayUnRegisterForm
     
         @classname = params[:id]
         #render json: params
    end
    
    def unregister
        
        
        
        gradclass_obj = Gradclass.find_by name: params[:id]
        
        student=Student.find_by ssn: params[:ssn]
        
        gradclass = student.gradclasses.find(gradclass_obj)
        student.gradclasses.delete(gradclass)
        
        render json: gradclass
        
        #sid = Student.create(studentclass_params)
        #class_id = GradClass.get_class_id(params[:id]).id
        #student_id = Student.get_student_id(params[:ssn]).id
        #gradclass.students.delete(student)
        #gradclass = Gradclass.find_by name: params[:id]
        #student = gradclass.Student.find_by ssn: params[:ssn]
        #if student
        #   gradclass.students.delete(student)
        #end

        #gradclass_student_record = 
        #puts gradclass_student_record
        #gradclass_student_record = Mine.where(:puser_id => @puser).where(:object_id => @object).first
        #gradclass_student_record=GradclassesStudents.where(:gradclass_id => class_id).where(:student_id => student_id).first
        #puts gradclass_student_record
        #gradclass_student_record = GradclassesStudents.find_by(gradclass_id: class_id,student_id: student_id)
        #render json: gradclass_student_record
        #render json: gradclass_student_record
        #GradclassesStudents.find(gradclass_student_record.gradclass_id).destroy
        #@gradclassesstudents.destroy
        # render json: params
    end
    
    def displayfindProfessorsForm
        
    end
    def findProfessors
        professorarray =[]
        
        student = Student.find_by name: params[:name] ,ssn: params[:ssn]
        
        professorarray =  Student.student_allProfessors(student)
       
       render json: professorarray
    end
    
     def displayfindClassesForm
        
    end
    
    def findClasses
        studentclasses =[]
        
        student = Student.find_by name: params[:name] ,ssn: params[:ssn]
        
        studentclasses =  Student.student_allClasses(student)
       
       render json: studentclasses
    end
    
    def noroute
        
    end
    
    # private
    #     def gradclass_params(pid)
            
    #         puts "pid is #{pid}"
    #         grad_params = {"name" => params[:name] , "startTime" => params[:startTime] ,"endTime" => params[:endTime],"maximumStudents" => params[:maximumStudents],"professor_id" => pid.id}
    #         return grad_params
    #         #params.permit(:name, :startTime, :endTime, :maximumStudents)
    #     end
        
    # private 
    #     def professor_params
    #         name = Hash.new()
    #         name[:name] = params[:professorName]
    #         return name
    #         #params.permit(params[:professorName])
    #     end
        
    private
        def studentclass_params()
            
            student_params ={"name" => params[:name] , "year" => params[:year] , "ssn" => params[:ssn] }
            return student_params
        end
        
    private 
        def gradclasses_students_params(gradclass,student)
            
            class_student_params = {"gradclass_id" => gradclass_id.id,"student_id" => student_id.id }
            return class_student_params
        end

end
