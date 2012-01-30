class AddColumnToMesas < ActiveRecord::Migration
  def change
    add_column :mesas, :votos_nulos, :integer
    add_column :mesas, :votos_blancos, :integer
  end
end
