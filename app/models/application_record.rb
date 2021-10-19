class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum tipo: [:Municipal, :Regional, :Metropolitana, :Especializada, :Departamento, :admin]
  enum cargo: [:Escrivão, :Inspetor, :Delegado]
  enum ais: [:'1', :'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9', :'10',
             :'11', :'12', :'13', :'14', :'15', :'16', :'17', :'18', :'19', :'20',
             :'21', :'22', :'23', :'24', :'25', :'26', :'27', :'28', :'29', :'30'
            ]
enum tipoentrada: [:Nomeação, :Remoção, :Permuta ]
            
enum situation: [:Enviada, :Recebida, :Devolvida]
end
