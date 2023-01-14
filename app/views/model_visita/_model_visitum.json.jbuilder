json.extract! model_visitum, :id, :id_usuario, :id_lugar, :costo_avion, :costo_hotel, :costo_transporte, :costo_comidas, :costo_gastos, :created_at, :updated_at
json.url model_visitum_url(model_visitum, format: :json)
