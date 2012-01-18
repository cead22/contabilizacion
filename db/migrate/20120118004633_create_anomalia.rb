class CreateAnomalia < ActiveRecord::Migration
  def change
    create_table :anomalia do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
