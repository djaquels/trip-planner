class AddDateTravelToModelVisita < ActiveRecord::Migration[5.2]
  def change
    add_column :model_visita, :datetravel, :date
  end
end
