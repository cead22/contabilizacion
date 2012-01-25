class CreateParroquia < ActiveRecord::Migration
  def change
    create_table :parroquia do |t|
      t.integer :id
      t.string :nombre
      t.integer :municipio_id

      t.timestamps
    end
  end
end
