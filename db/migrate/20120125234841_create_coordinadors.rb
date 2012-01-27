class CreateCoordinadors < ActiveRecord::Migration
  def change
    create_table :coordinadors do |t|
      t.string :nombre
      t.string :telefono1
      t.string :telefono2

      t.timestamps
    end
  end
end
