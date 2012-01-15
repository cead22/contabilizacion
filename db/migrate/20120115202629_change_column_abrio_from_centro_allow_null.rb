class ChangeColumnAbrioFromCentroAllowNull < ActiveRecord::Migration
  def up
    change_column :centros, :abrio, :time, :null => true
  end

  def down
  end
end
