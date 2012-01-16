class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.integer :numero
      t.integer :centro_id
      t.integer :votos_hc
      t.integer :votos_ll
      t.integer :votos_pp
      t.integer :votos_mc
      t.integer :votos_da
      t.integer :votos_pm

      t.timestamps
    end
  end
end
