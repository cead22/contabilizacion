class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.integer :id
      t.string :nombre
      t.integer :estado_id

      t.timestamps
    end
  end
end
