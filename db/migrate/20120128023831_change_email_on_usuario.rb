class ChangeEmailOnUsuario < ActiveRecord::Migration
  def change
    change_column :usuarios, :email, :string, :null => true
  end
end
