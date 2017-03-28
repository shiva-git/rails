class Professor < ActiveRecord::Base
    has_many :gradclasses
    
    validates :name ,presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "proessors name must have only letters" },uniqueness: {case_sensitive: false},on: :create
    def self.createProfessor(profName)
        
        begin
            professor = Professor.new
            professor = Professor.create({"name" => profName})
           
        rescue
            professor.valid?
            professor.errrors

        end
    end
    
end
