class CreateAttorneys < ActiveRecord::Migration[7.0]
  def change
    create_table :attorneys do |t|
      t.string :sbn
      t.integer :status
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.integer :discipline
      t.string :law_school
      t.string :admit_date

      t.timestamps
    end
  end
end
