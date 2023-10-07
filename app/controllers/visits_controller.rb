class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visit, only: %i[ show edit update destroy ]

  # GET /visits or /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1 or /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits or /visits.json
  def create
    visitante = Visitante.find_by(nome: params[:visit][:visitante_nome]) ||
               Visitante.find_by(cpf: params[:visit][:visitante_cpf])
  
    @visit = Visit.new(
      visitante: visitante,
      setor_id: params[:visit][:setor_id],
      funcionario_id: params[:visit][:funcionario_id],
      horario: params[:visit][:horario]
    )
  
    if @visit.save
      redirect_to @visit, notice: "Visita criada com sucesso."
    else
      render :new
    end
  end
  

  # PATCH/PUT /visits/1 or /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_url(@visit), notice: "Visit was successfully updated." }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1 or /visits/1.json
  def destroy
    @visit.destroy!

    respond_to do |format|
      format.html { redirect_to visits_url, notice: "Visit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visit_params
      params.require(:visit).permit(:visitante_nome, :setor_id, :funcionario_id, :horario)
    end
end
