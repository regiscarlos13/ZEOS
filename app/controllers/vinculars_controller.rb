class VincularsController < ApplicationController
  before_action :set_department, only: %i[vincular_servidor]

  before_action :tipoentrada, only: %i[vincular_servidor edit]

  before_action :set_vincular, only: %i[edit update]

  include Enuns


  def index
    if current_user.department.tipo == 'admin'
      @departments = Department.where.not(tipo: 'admin')
    else
      @departments = Department.where(dpi_id: current_user.department.id)
    end
  end

  def vincular_servidor
   
   @servidor_vinculados = Vincular.where(saida: nil).pluck(:server_id)
    @servidor = Server.where.not(id: @servidor_vinculados)
    @vincular = Vincular.where(department_id: @department).where(saida: nil)
  end

  def edit
    respond_to do |format|
      format.js
    end  
  end

  def update
    respond_to do |format|
      if @vincular.update(vincular_params)
        format.html { redirect_to vincular_servidor_path(@department), notice: "Registro Atualizado com Sucesso" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

  end

  def create
    @department = Department.find(params[:department_id])
    @vincular = @department.vinculars.create(vincular_params)
    redirect_to vincular_servidor_path(@department)
  end

  def destroy
    @vincular = Vincular.find(params[:id])
    @vincular.destroy
    respond_to do |format|
      format.html { redirect_to vincular_servidor_path(@department), notice: "Registro Removido com Sucesso" }
    end
    
  end

  private

    def set_vincular
      @vincular = Vincular.find(params[:id])
      
    end
    def set_department
      @department = Department.find(params[:id])
    end
    def vincular_params
      params.require(:vincular).permit(:server_id, :entrada, :tipoentrada, 
              :saida, :tiposaida, :plantao )
    end

    

end
