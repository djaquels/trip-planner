class LugarsController < ApplicationController
  before_action :set_lugar, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /lugars
  # GET /lugars.json
  def index
    @lugars = Lugar.all
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # GET /lugars/1
  # GET /lugars/1.json
  def show
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # GET /lugars/new
  def new
    @lugar = Lugar.new
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # GET /lugars/1/edit
  def edit
    @user = current_model
    @pais = Country.where(id: @user.pais)
  end

  # POST /lugars
  # POST /lugars.json
  def create
    @lugar = Lugar.new(lugar_params)
    respond_to do |format|
      if @lugar.save
        format.html { redirect_to @lugar, notice: 'Lugar was successfully created.' }
        format.json { render :show, status: :created, location: @lugar }
      else
        format.html { render :new }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lugars/1
  # PATCH/PUT /lugars/1.json
  def update
    respond_to do |format|
      if @lugar.update(lugar_params)
        format.html { redirect_to @lugar, notice: 'Lugar was successfully updated.' }
        format.json { render :show, status: :ok, location: @lugar }
      else
        format.html { render :edit }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lugars/1
  # DELETE /lugars/1.json
  def destroy
    @lugar.destroy
    respond_to do |format|
      format.html { redirect_to lugars_url, notice: 'Lugar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lugar
      @lugar = Lugar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lugar_params
      params.require(:lugar).permit(:id_pais, :nombre,:image_place,:id_usuario)
    end
end
