class VisitantesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visitante, only: [:show, :edit, :update, :destroy]

  def index
    @visitantes = Visitante.all
  end

  def show
  end

  def new
    @visitante = Visitante.new
  end

  def create
    @visitante = Visitante.new(visitante_params)
    @visit.visitante_id = params[:visitante_id]

    if @visitante.save
      redirect_to @visitante, notice: 'Visitante was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @visitante.update(visitante_params)
      redirect_to @visitante, notice: 'Visitante was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @visitante.destroy
    redirect_to visitantes_url, notice: 'Visitante was successfully destroyed.'
  end

  private

  def set_visitante
    @visitante = Visitante.find(params[:id])
  end

  def visitante_params
    params.require(:visitante).permit(:cpf, :nome, :rg, :telefone, :foto)
  end
end

