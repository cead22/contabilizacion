class CreateTipoIncidencia < ActiveRecord::Migration
  def change
    create_table :tipo_incidencia do |t|
      t.integer :anomalia_id
      t.text :descripcion

      t.timestamps
    end
  end
end
