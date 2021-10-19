class Vincular < ApplicationRecord
  belongs_to :server
  belongs_to :department

  has_many :productivits
  
  validates_presence_of :entrada, :tipoentrada
  validates_presence_of :saida, :tiposaida, on: :edit

  def name
    server.name
  end
end
