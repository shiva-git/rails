class Student < ActiveRecord::Base
    
    has_and_belongs_to_many :gradclasses, :uniq => true
    
    validates :name,presence: true,format: { with: /\A[a-zA-Z]+\z/, message: "only letters are allowed" } ,on: :create
    validates :ssn,presence: true,uniqueness: true,numericality: { only_integer: true },length: { is: 9 } ,on: :create
    validates :year,presence: true,numericality: { only_integer: true},length: { is: 4}, on: :create
    
    def self.get_student(ssn_no)
      
        begin
          student = Student.new
          student = Student.find_by ssn: ssn_no
          if(student)
          return student
        else
          student.errors.add(:NotFound, "Student doesn't exist")
          return student
        end
        rescue
          student.errors.add(:NotFound, "Student doesn't exist")
          return student
        end
        
    end
    
    def self.register(classname , studentclass_params)
      
          begin
            student = Student.new
            gradclass = Gradclass.get_class(classname)
            if(Student.where(:ssn => studentclass_params["ssn"]).exists?)
                #gradclass = Gradclass.get_class(classname)
                student = Student.find_by ssn: studentclass_params["ssn"]
                
                student_id =student.id
                gradclass_id = gradclass.id
                sql = "INSERT INTO gradclasses_students VALUES (#{gradclass_id}, #{student_id});"
                ActiveRecord::Base.connection.execute(sql)
                #render json: "You have been successfully registered"
            else
                #gradclass = Gradclass.get_class(classname)
                student = gradclass.students.create(studentclass_params)
                
            end
          rescue 
              student.valid?
              student.blank?
              return student

          end
    end
    
    def self.unregister(form_params)
      begin
        student = Student.new
        gradclass_obj = Gradclass.get_class(form_params[:id])
        student=Student.get_student(form_params[:ssn])
        if(student.nil?)
          student.errors.add(:Error, "Student not found")
          return student
        end
          gradclass = student.gradclasses.find(gradclass_obj)
          student = student.gradclasses.delete(gradclass)
          return student
      rescue
        #student.errors.add(:error, "Unknown")
        student.valid?
        student.blank?
        student.errors.add(:Error, "Student not registered for any classes")
         return student
      end
       
    end
    
    def self.student_allProfessors(form_params)
      student = Student.find_by ssn: form_params[:ssn]
      professorarray =[]
      classarray = student.gradclasses
      classarray.each {|gradclass| puts gradclass.professor_id ,professorarray << gradclass.professor.name}
      
      return professorarray
    end
    
    def self.student_allClasses(form_params)
      studentclasses =[]
      student = Student.find_by ssn: form_params[:ssn]
      classarray = student.gradclasses
      classarray.each {|gradclass| studentclasses << gradclass.name}
      
      return studentclasses
    end
    
    def self.student_allClassmates(form_params)
      classmatesarray = []
      classmateslist = Hash.new()
      student = Student.find_by ssn: form_params[:ssn]                                                                                                                                                                                                                                                                                                                                        
      classesarray = student.gradclasses
      classesarray.each { |gradclass| classmatesarray << gradclass.students }
      classmatesarray.each {  |classmates| classmates.each {  |classmate| classmateslist[classmate.ssn] = classmate.name unless classmate == student  }}
      
      return classmateslist
    end
    
    def self.getUnregisteredClasses
      
        gradclassarray=[]
        result = Hash.new()
        gradclasses = Gradclass.all
        gradclasses.each{ |gradclass| gradclassarray << gradclass.name}
        students = Student.all
        students.each { |student|  result[student.name] =  (gradclassarray - getStudentClases(student))  }
        return result
    end
    
    def self.getStudentClases(student)
        registerClassesarray = []
        registerClasses = student.gradclasses
        registerClasses.each{  |r| registerClassesarray << r.name}
        return registerClassesarray
            
    end
end

