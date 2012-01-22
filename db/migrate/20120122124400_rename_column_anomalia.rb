class RenameColumnAnomalia < ActiveRecord::Migration
  def up
    rename_column :anomalia, :tipo_incidencia_id, :tipo_anomalia_id
    rename_table :tipo_incidencia, :tipo_anomalia
  end

  def down
  end
end
