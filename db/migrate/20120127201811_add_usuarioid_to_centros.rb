class AddUsuarioidToCentros < ActiveRecord::Migration
  def change
    add_column :centros, :usuario_id, :integer
  end
end
