class CreateCategoria < ActiveRecord::Migration[5.2]
  def change
    create_table :categoria do |t|
      t.text :categoria
      t.float :valor
      t.integer :id_viaje

      t.timestamps
    end
  end
end
