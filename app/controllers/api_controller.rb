class ApiController < ApplicationController
    
    def home
    end
    
    def displayform
        
    end
    
    def create
        
        GradClass.create(gradclass_params)
        render json: params
    end
    
    def noroute
        
    end
    
    private
        def gradclass_params
            params.permit(:name, :startTime, :endTime, :maximumStudents)
        end
        
       
    
end
