class Changes < ActiveRecord::Migration
  def up
    change_column :anomalia, :descripcion, :string
    rename_column :incidencia, :tipo, :anomalia_id
  end

  def down
  end
end
