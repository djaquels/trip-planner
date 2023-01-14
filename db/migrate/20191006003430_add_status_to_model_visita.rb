class AddStatusToModelVisita < ActiveRecord::Migration[5.2]
  def change
    add_column :model_visita, :status, :string
  end
end
