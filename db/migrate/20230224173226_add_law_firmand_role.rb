class AddLawFirmandRole < ActiveRecord::Migration[7.0]
  def change
      add_column :attorneys, :lawfirm, :string

  end
end
