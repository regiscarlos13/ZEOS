class Server < ApplicationRecord
    

    has_many :vinculars

    validates_presence_of :name, :matricula, :cpf, :cargo, :email, :posse

    validates_uniqueness_of :email, :cpf, :matricula, if: :save_cpf
    
    def servidor
        matricula1 = matricula.gsub(/\A(\d{3})(\d{3})(\d{1})(\d{1})\Z/, "\\1.\\2-\\3-\\4")
        "#{matricula1} - #{name}"
    end
    

    private

    def save_cpf
        self.cpf = self.cpf.gsub(/[.-]/, "")  
        self.matricula = self.matricula.gsub(/[.-]/, "")  
        
    end
end
