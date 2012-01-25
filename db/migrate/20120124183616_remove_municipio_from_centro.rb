class RemoveMunicipioFromCentro < ActiveRecord::Migration
  def up
    remove_column :centros, :municipio
    remove_column :centros, :estado
  end

  def down
    add_column :centros, :municipo, :integer
    add_column :centros, :estado, :integer 
  end
end
