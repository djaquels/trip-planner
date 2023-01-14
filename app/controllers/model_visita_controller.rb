class ModelVisitaController < ApplicationController
  before_action :set_model_visitum, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'dashboard'
  # GET /model_visita
  # GET /model_visita.json
  def index
    @model_visita = ModelVisitum.all
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # GET /model_visita/1
  # GET /model_visita/1.json
  def show
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # GET /model_visita/new
  def new
    @model_visitum = ModelVisitum.new
    @user = current_model
    @pais = Country.where(id: @user.pais)
    #puts @user.lugars.to_yaml
    #puts "salsa!"
  end

  # GET /model_visita/1/edit
  def edit
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # POST /model_visita
  # POST /model_visita.json
  def create
    @model_visitum = ModelVisitum.new(model_visitum_params)
    Rails.logger.info "#{model_visitum_params}"
    #puts "#{model_visitum_params.to_yaml}"
    respond_to do |format|
      if @model_visitum.save
        format.html { redirect_to @model_visitum, notice: 'Model visitum was successfully created.' }
        format.json { render :show, status: :created, location: @model_visitum }
      else
        puts @model_visitum.errors.to_yaml
        format.html { render :new }
        format.json { render json: @model_visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_visita/1
  # PATCH/PUT /model_visita/1.json
  def update
    respond_to do |format|
      if @model_visitum.update(model_visitum_params)
        format.html { redirect_to @model_visitum, notice: 'Model visitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_visitum }
      else
        format.html { render :edit }
        format.json { render json: @model_visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_visita/1
  # DELETE /model_visita/1.json
  def destroy
    @model_visitum.destroy
    respond_to do |format|
      format.html { redirect_to model_visita_url, notice: 'Model visitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_visitum
      @model_visitum = ModelVisitum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_visitum_params
      params.require(:model_visitum).permit(:id_usuario, :id_lugar, :costo_avion, :costo_hotel, :costo_transporte, :costo_comidas, :costo_gastos,:datetravel,:status, categorias_attributes:[:id,:categoria,:valor,:_destroy])
    end
end
