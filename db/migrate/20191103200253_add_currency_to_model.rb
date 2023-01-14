class AddCurrencyToModel < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :currency, :integer
  end
end
