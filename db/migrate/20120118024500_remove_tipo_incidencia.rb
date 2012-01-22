class RemoveTipoIncidencia < ActiveRecord::Migration
  def up
    drop_table :tipo_incidencia
  end

  def down
  end
end
