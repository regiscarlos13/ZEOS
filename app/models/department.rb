class Department < ApplicationRecord

    has_many :vinculars
    has_many :cidades
    has_many :users
    has_many :productivits

    validates_presence_of :name, :sigla, :tipo, :telefone,
                          :email, :cep

    belongs_to :dpi, class_name: 'Department', optional:true
    belongs_to :regional, class_name: 'Department', optional:true

    has_many :users
    before_save :save_cpf

private

def save_cpf
self.cep = self.cep.gsub(/[.-]/, "")  
end
end
