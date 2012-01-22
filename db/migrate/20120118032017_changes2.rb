class Changes2 < ActiveRecord::Migration
  def up
    remove_column :anomalia, :incidencia_id
  end

  def down
  end
end
