class DashboardController < ApplicationController
  layout 'dashboard'
  def dashboard
    viaje_id = params[:viaje]
    mapeador = {"costo_avion" =>"Ticket Cost" , "costo_hotel" => "Hotel", "costo_gastos" => "General Expenses", "costo_transporte" => "Local Transport" }
    @categorias_user = []
    @categorias_user_valores = []
    @user = current_model
    @currency = Currency.where(id: @user.currency)
    @pais = Country.where(id: @user.pais)
    @saves = Ahorro.where(id_viaje: viaje_id)
    @viaje = ModelVisitum.where(id: viaje_id).take!
    @custom_categorias = @viaje.categorias
    @custom_categorias.each { |categoria| @categorias_user.push(categoria.categoria)
      @categorias_user_valores.push(categoria.valor)
    }
    @categorias = @viaje.attributes.keys.select { | string| !string.include? 'id' and !string.include? '_at' and !string.include? 'status' and !string.include? 'date' and !string.include? 'ahorro'}
    @categorias = @categorias.map { |e| mapeador[e.to_s]}
    @categorias = @categorias.concat(@categorias_user)
    @valores =    @viaje.attributes.select { |key,string| !key.include? 'id' and !key.include? '_at' and !key.include? 'status' and !key.include? 'date' and !key.include? 'ahorro'}
    @total = @valores.values.inject(0){|sum,x| sum.to_f + x.to_f } + @categorias_user_valores.inject(0){|sum,x| sum.to_f + x.to_f }
    @values = @valores.values.map {|valor| valor.to_f} 
    @values.concat(@categorias_user_valores)
    initial = @viaje.created_at.to_date
    final = @viaje.datetravel
    mensualidades = (final.year * 12 + final.month) - (initial.year * 12 + initial.month)
    ahorrado = 0
    @mensualidad = @total / mensualidades
    @dataset = {}
    @dataset_ahorro = {}
    @ahorro = Ahorro.new
    depositos  = 0
    @meses = []
    while(initial <= final)
      @dataset[initial] = ahorrado + @mensualidad
      ahorrado += @mensualidad
      @meses.push(initial)
      initial = initial + 1.month
    end
    @saves.each do |deposito|
      if @dataset_ahorro[deposito.fecha_deposito]
        depositos +=   deposito.cantidad
        @dataset_ahorro[deposito.fecha_deposito] +=  deposito.cantidad
      else
        depositos += deposito.cantidad 
        @dataset_ahorro[deposito.fecha_deposito] =  depositos
      end
    end
  end
end
