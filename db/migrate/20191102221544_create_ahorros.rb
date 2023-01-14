class CreateAhorros < ActiveRecord::Migration[5.2]
  def change
    create_table :ahorros do |t|
      t.integer :id_viaje
      t.date :fecha_deposito
      t.integer :numero_depostio

      t.timestamps
    end
  end
end
