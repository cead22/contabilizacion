class CreateTipoIncidencia < ActiveRecord::Migration
  def change
    create_table :tipo_incidencia do |t|
      t.string :descripcion
      t.string :anomalia_id

      t.timestamps
    end
  end
end
