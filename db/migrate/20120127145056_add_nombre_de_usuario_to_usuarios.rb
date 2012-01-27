class AddNombreDeUsuarioToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :username, :string
  end
end
