class AddIncidenciaToAnomalia < ActiveRecord::Migration
  def change
    add_column :anomalia, :incidencia_id, :integer
  end
end
