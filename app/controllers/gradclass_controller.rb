class GradclassController < ApplicationController
    
    def displayClassForm
      
    end
    
    def displayfindClassProfessorForm
 
    end
    
    def displayfindStudentsForm
        
    end
    
    def create
        professor = Professor.createProfessor(params[:professorName])
        gradclass = Gradclass.createGradclass(params,professor)
        if (gradclass.errors.empty?)
            render :json => { :message => "Class Created Successfully." }, :status => 201
        else
            render :json => { :error => gradclass.errors }, :status => 422
        end
    end
    
    def classdetails
    
        gradclass = Gradclass.get_class(params[:id])
        if(gradclass)
            render :json => { :classdetails => gradclass }, :status => 200 
        else
            render :json => { :error => "Class doesn't exist" }, :status => 422
        end
    end
    
    def findClassProf
        gradclass= Gradclass.get_class(params[:name])
        if (gradclass)
            render :json => {"The professor hosting the class is : " => "#{ Gradclass.class_professor(params[:name]) }"} , :status => 200
            #render :json => { :message => "Class Created Successfully." }, :status => 201
        else
            render :json => { :error => "Class doesn't exist" }, :status => 422
        end
    end
    
    def allStudents
        gradclass= Gradclass.get_class(params[:name])
        if(gradclass)
            render :json => {"Following are the students register to the class :  #{ params[:name] } " => 
        "#{(Gradclass.class_allStudents(params[:name]))}"} , :status => 200
            render :json => { :error => "Class doesn't exist" }, :status => 422
        end
    end
    
end
