class CreateModelVisita < ActiveRecord::Migration[5.2]
  def change
    create_table :model_visita do |t|
      t.integer :id_usuario
      t.integer :id_lugar
      t.float :costo_avion
      t.float :costo_hotel
      t.float :costo_transporte
      t.float :costo_comidas
      t.float :costo_gastos

      t.timestamps
    end
  end
end
