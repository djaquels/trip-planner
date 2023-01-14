class AddNombreToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :nombre, :string
    add_column :models, :pais, :integer
  end
end
