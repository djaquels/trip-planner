class AddCantidadToAhorro < ActiveRecord::Migration[5.2]
  def change
    add_column :ahorros, :cantidad, :float
  end
end
