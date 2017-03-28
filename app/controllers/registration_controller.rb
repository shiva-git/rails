class RegistrationController < ApplicationController
    
    def displayRegisterForm
        @gradclassname = params[:id]
    end
    
    def displayUnRegisterForm
         @classname = params[:id]
    end
    
    def register
        
        if(Gradclass.get_class(params[:id]))
            result = Student.register(params[:id] , studentclass_params)
            if(result.errors.empty?)
                render :json => {:meaasge =>  "You have been successfully registered" } ,:status => 201
            else
                render :json => {:error => result.errors } , :status => 422
            end
        else
            render :json => { :error => "Class doesn't exist" }, :status => 422
        end
        
    end
    
    def unregister
        
        gradclass = Gradclass.get_class(params[:id])
        if(gradclass.nil? || gradclass.empty?)
            render :json => { :error => "Class doesn't exist" }, :status => 422
        else
            result = Student.unregister(params)
            if(result.errors.empty?)
                render :json => {:message =>  "You have been successfully unregistered" } ,:status => 200
            else
                render :json => {:error => result.errors } , :status => 422
            end
        end
    end
    
    private
        def studentclass_params
            student_params ={"name" => params[:name] , "year" => params[:year] , "ssn" => params[:ssn] }
            return student_params
        end
end
