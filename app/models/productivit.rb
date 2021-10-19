class Productivit < ApplicationRecord
  belongs_to :vincular 
  belongs_to :department 

  after_create_commit { broadcast_prepend_to "productivits" }  
  after_update_commit { broadcast_replace_to "productivits" }  
  after_destroy_commit { broadcast_remove_to "productivits" }  

  validates_presence_of :data
  
  validates_uniqueness_of :data, scope: [:department_id]

  before_save :save_name_black
  before_create :save_situation

  def save_situation

    self.situation = 0

  end

  
  def save_name_black
   
    self.flagrante.blank? ? self.flagrante = 0 : self.flagrante 
    self.portaria.blank? ? self.portaria = 0 : self.portaria 
    self.tco.blank? ? self.tco = 0 : self.tco 
    self.boc.blank? ? self.boc = 0 : self.boc 
    self.bo.blank? ? self.bo = 0 : self.bo 
     

    self.iprecebidos.blank? ? self.iprecebidos = 0 : self.iprecebidos
    self.iptransferidos.blank? ? self.iptransferidos = 0 : self.iptransferidos
    self.tcos.blank? ? self.tcos = 0 : self.tcos
    self.iphomrelautoria.blank? ? self.iphomrelautoria = 0 : self.iphomrelautoria
    self.iphomrelasemautoria.blank? ? self.iphomrelasemautoria = 0 : self.iphomrelasemautoria
    self.iprouborelautoria.blank? ? self.iprouborelautoria = 0 : self.iprouborelautoria
    self.iprouborelsemautoria.blank? ? self.iprouborelsemautoria = 0 : self.iprouborelsemautoria
    self.ipocrimrelautoria.blank? ? self.ipocrimrelautoria = 0 : self.ipocrimrelautoria
    self.ipocrimrelsemautoria.blank? ? self.ipocrimrelsemautoria = 0 : self.ipocrimrelsemautoria
    self.ipoutroscrimrelautoria.blank? ? self.ipoutroscrimrelautoria = 0 : self.ipoutroscrimrelautoria
    self.ipoutroscrimrelsemautoria.blank? ? self.ipoutroscrimrelsemautoria = 0 : self.ipoutroscrimrelsemautoria
    self.presoflahompc.blank? ? self.presoflahompc = 0 : self.presoflahompc
    self.presoflaoutropc.blank? ? self.presoflaoutropc = 0 : self.presoflaoutropc
    self.presoflapm.blank? ? self.presoflapm = 0 : self.presoflapm
    self.buscaapreensao.blank? ? self.buscaapreensao = 0 : self.buscaapreensao
    self.buscaapreensaomenor.blank? ? self.buscaapreensaomenor = 0 : self.buscaapreensaomenor
    self.mandadoprisaohompc.blank? ? self.mandadoprisaohompc = 0 : self.mandadoprisaohompc
    self.mandadoprisaoouotrospc.blank? ? self.mandadoprisaoouotrospc = 0 : self.mandadoprisaoouotrospc
    self.pedidoprisao.blank? ? self.pedidoprisao = 0 : self.pedidoprisao
    self.pedidobusca.blank? ? self.pedidobusca = 0 : self.pedidobusca
    self.pedidoip.blank? ? self.pedidoip = 0 : self.pedidoip
    self.pedidosigilo.blank? ? self.pedidosigilo = 0 : self.pedidosigilo
    self.notificacoes.blank? ? self.notificacoes = 0 : self.notificacoes
    self.oitivas.blank? ? self.oitivas = 0 : self.oitivas
    self.ordemissao.blank? ? self.ordemissao = 0 : self.ordemissao
    self.arma.blank? ? self.arma = 0 : self.arma
    self.municoes.blank? ? self.municoes = 0 : self.municoes
    self.celular.blank? ? self.celular = 0 : self.celular
    self.maconha.blank? ? self.maconha = 0 : self.maconha
    self.crack.blank? ? self.crack = 0 : self.crack
    self.cocaina.blank? ? self.cocaina = 0 : self.cocaina
    self.outra.blank? ? self.outra = 0 : self.outra
    self.precatoriarecebida.blank? ? self.precatoriarecebida = 0 : self.precatoriarecebida
    self.precatoriaexpedida.blank? ? self.precatoriaexpedida = 0 : self.precatoriaexpedida


  end


end
