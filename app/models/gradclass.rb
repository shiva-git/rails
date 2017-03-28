class Gradclass < ActiveRecord::Base
  
    has_and_belongs_to_many :students ,:uniq => true
    belongs_to :professor
    
    validates :name,presence: true ,uniqueness: { case_sensitive: false ,message: "Professoe name not unique" },on: :create
    
    validates_associated :professor ,on: :create
    
    def self.createGradclass(form_params,professor)
      
      begin
        
        gradclass = Gradclass.new
        gradclass = professor.gradclasses.create({"name" => form_params[:name] , "startTime" => form_params[:startTime] ,"endTime" => form_params[:endTime],"maximumStudents" => form_params[:maximumStudents]})
        
      rescue
        gradclass.valid?
        gradclass.blank?
        return gradclass
      
      #return self.errors.full_messages
      
      end
    
    end
  
    def self.class_professor(classname)
      
        #gradclass = Gradclass.new
        gradclass = Gradclass.get_class(classname)
      return gradclass.professor.name
       
      
    end
    
    def self.class_allStudents(classname)
      
      begin
      gradclass = Gradclass.get_class(classname)
      studentslist = Hash.new()
      studentsarray = gradclass.students
      studentsarray.each { |student|  studentslist[student.ssn] = student.name }
      
      return studentslist
      rescue
      
      return false
      end
    end
    
    def self.get_class(classname)
      
       begin
        gradclass = Gradclass.new
        gradclass=Gradclass.find_by name: classname
        return gradclass
      rescue
        gradclass.valid?
        gradclass.blank?
        return false
     end
    end

end
