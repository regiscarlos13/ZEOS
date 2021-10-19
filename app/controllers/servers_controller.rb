class ServersController < ApplicationController
  before_action :set_server, only: %i[ show edit update destroy ]

  before_action :cargos, only: %i[new edit index show]

  include Enuns



  def index
    @servers = Server.all
  end

  
  def show
  end

  
  def new
    @server = Server.new
  end

  def edit
  end

  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to servers_path, notice: "Registro Criado com Sucesso" }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to servers_path, notice: "Registro Atualizado com Sucesso" }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1 or /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: "Registro Removido com Sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def server_params
      params.require(:server).permit(:matricula, :name, :cpf, :email, :cargo, :posse)
    end
end
