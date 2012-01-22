class ChangeTipoFromIncidencia < ActiveRecord::Migration
  def up
    change_column :incidencia, :tipo, :string
  end

  def down
  end
end
