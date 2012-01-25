class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.integer :id
      t.string :nombre

      t.timestamps
    end
  end
end
