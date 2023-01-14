class AhorrosController < ApplicationController
  before_action :set_ahorro, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /ahorros
  # GET /ahorros.json
  def index
    @ahorros = Ahorro.all
  end

  # GET /ahorros/1
  # GET /ahorros/1.json
  def show
  end

  # GET /ahorros/new
  def new
    @ahorro = Ahorro.new
  end

  # GET /ahorros/1/edit
  def edit
  end

  # POST /ahorros
  # POST /ahorros.json
  def create
    @ahorro = Ahorro.new(ahorro_params)

    respond_to do |format|
      if @ahorro.save
        format.html { redirect_to "/#dashboard", notice: 'Ahorro was successfully created.' }
        format.json { render :show, status: :created, location: @ahorro }
      else
        format.html { render :new }
        format.json { render json: @ahorro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ahorros/1
  # PATCH/PUT /ahorros/1.json
  def update
    respond_to do |format|
      if @ahorro.update(ahorro_params)
        format.html { redirect_to "/#dashboard", notice: 'Ahorro was successfully updated.' }
        format.json { render :show, status: :ok, location: @ahorro }
      else
        format.html { render :edit }
        format.json { render json: @ahorro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ahorros/1
  # DELETE /ahorros/1.json
  def destroy
    @ahorro.destroy
    respond_to do |format|
      format.html { redirect_to ahorros_url, notice: 'Ahorro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ahorro
      @ahorro = Ahorro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ahorro_params
      params.require(:ahorro).permit(:id_viaje, :fecha_deposito, :cantidad)
    end
end
