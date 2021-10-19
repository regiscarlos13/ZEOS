class Cidade < ApplicationRecord
  belongs_to :city
  belongs_to :department

  validates_presence_of :inicio
end
