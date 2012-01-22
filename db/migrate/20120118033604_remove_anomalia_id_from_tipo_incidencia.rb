class RemoveAnomaliaIdFromTipoIncidencia < ActiveRecord::Migration
  def up
    remove_column :tipo_incidencia, :anomalia_id
  end

  def down
  end
end
