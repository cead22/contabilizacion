class AddTipoIncidenciaIdToAnomalia < ActiveRecord::Migration
  def change
    add_column :anomalia, :tipo_incidencia_id, :integer
  end
end
