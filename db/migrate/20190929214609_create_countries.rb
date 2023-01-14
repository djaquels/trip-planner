class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.integer :iso
      t.string :name
      t.string :nicename
      t.string :iso3
      t.integer :numcode
      t.integer :phonecode
    end
  end
end
