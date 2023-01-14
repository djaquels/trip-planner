class AddConfirmableEmailToDevise < ActiveRecord::Migration[5.2]
  def change
    change_table(:models) do |t| 
      t.string   :unconfirmed_email
    end
  end
end
