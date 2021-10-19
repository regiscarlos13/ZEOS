class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]
  before_action :tipos, only: %i[new edit index show]
  before_action :ais, only: %i[new edit index show]

  before_action :set_regional, only: %i[ show edit update destroy new]

  include Enuns

  def index
    if current_user.department.tipo == 'admin'
      @departments = Department.where.not(tipo: 'admin')
    else
      @departments = Department.where(dpi_id: current_user.department.id)
    end
  end

  def show
  end

  def new
    @department = Department.new


  end

  def edit
  end

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: "Registro Criado com Sucesso" }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: "Registro Atualizado com Sucesso" }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Registro Removido com Sucesso" }
      format.json { head :no_content }
    end
  end

  private

    def set_regional
      @regional = Department.where(tipo: 'Regional')
    end
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, :sigla, :tipo, :cep, :logradouro, 
        :complemento, :bairro, :localidade, :uf, :telefone, :email, :dpi_id, :ais,
        :regional_id)
    end
end
