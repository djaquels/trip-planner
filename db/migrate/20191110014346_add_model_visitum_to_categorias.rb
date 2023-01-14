class AddModelVisitumToCategorias < ActiveRecord::Migration[5.2]
  def change
    add_reference :categoria, :model_visita, foreign_key: true
  end
end
