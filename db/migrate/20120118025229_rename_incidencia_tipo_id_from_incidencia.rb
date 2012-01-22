class RenameIncidenciaTipoIdFromIncidencia < ActiveRecord::Migration
  def up
    rename_column :incidencia, :tipo_incidencia_id, :tipo
  end

  def down
  end
end
