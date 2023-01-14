class AddIdUsuarioToLugar < ActiveRecord::Migration[5.2]
  def change
    add_column :lugars, :id_usuario, :integer
  end
end
