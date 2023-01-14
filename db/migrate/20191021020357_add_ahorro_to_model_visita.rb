class AddAhorroToModelVisita < ActiveRecord::Migration[5.2]
  def change
    add_column :model_visita, :ahorro, :float
  end
end
