class AddCoordinadorToCentro < ActiveRecord::Migration
  def change
    add_column :centros, :coordinador_id, :integer
  end
end
