class AnomaliaIdInteger < ActiveRecord::Migration
  def up
    change_column :incidencia, :anomalia_id, :integer
  end

  def down
  end
end
