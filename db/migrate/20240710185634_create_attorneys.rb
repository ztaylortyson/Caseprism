class CreateAttorneys < ActiveRecord::Migration[7.1]
  def change
    create_table :attorneys do |t|
      t.string :sbn
      t.string :status
      t.string :full_name
      t.string :firm_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :tel
      t.string :email
      t.string :old_firm_name

      t.timestamps
    end
  end
end
