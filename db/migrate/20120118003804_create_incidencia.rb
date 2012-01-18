class CreateIncidencia < ActiveRecord::Migration
  def change
    create_table :incidencia do |t|
      t.integer :centro_id
      t.time :hora
      t.integer :tipo_incidencia_id
      t.text :descripcion

      t.timestamps
    end
  end
end
