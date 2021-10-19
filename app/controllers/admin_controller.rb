class AdminController < ApplicationController
  def productivit
  
    @departments = Department.where(dpi_id: current_user.department.id)
    @productivits = Productivit.where(department_id: @departments.ids).order(:data)
    @productivits_recebidos = Productivit.where(department_id: @departments.ids).where(situation: 'Recebida').order(:data)
  end
end
