class ProductivitsController < ApplicationController
  before_action :set_productivit, only: %i[ show edit update destroy ]

  before_action :situation

  include Enuns


  def index

    @productivits = Productivit.where(department_id: current_user.department.id).where.not(situation: 'Recebida').order(:data)
  end

  def show
  end

  def new
    @productivit = Productivit.new
  end

  def edit
    respond_to do |format|
      format.js
      format.html
    end  
  end

  def create
    @productivit = Productivit.new(productivit_params)

    respond_to do |format|
      if @productivit.save
          format.html { redirect_to @productivit, notice: "Registro Criado com Sucesso" }
      else
          format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @productivit.update(productivit_params)
        format.html { redirect_to @productivit, notice: "Registro Atualizado com Sucesso" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @productivit.destroy
    respond_to do |format|
      format.html { redirect_to productivits_url, notice: "Registro apagado com Sucesso" }
    end
  end

  private
    def set_productivit
      @productivit = Productivit.find(params[:id])
    end

    def productivit_params
        params.require(:productivit).permit(:data, :vincular_id, :flagrante, :portaria, 
          :boc, :tco, :bo, :iprecebidos, :iptransferidos, :tcos, :iphomrelautoria, 
          :iphomrelasemautoria, :iprouborelautoria, :iprouborelsemautoria, 
          :ipocrimrelautoria, :ipocrimrelsemautoria, :ipoutroscrimrelautoria, 
          :ipoutroscrimrelsemautoria, :presoflahompc, :presoflaoutropc, :presoflapm, 
          :buscaapreensao, :buscaapreensaomenor, :mandadoprisaohompc, 
          :mandadoprisaoouotrospc, :pedidoprisao, :pedidobusca, :pedidoip, 
          :pedidosigilo, :notificacoes, :oitivas, :ordemissao, :arma, :municoes, 
          :celular, :maconha, :crack, :cocaina, :outra, :precatoriarecebida, 
          :precatoriaexpedida, :situation, :department_id)
     
    end

end