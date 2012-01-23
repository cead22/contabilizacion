class AddEncryptableToUsuario < ActiveRecord::Migration
  def change
    change_table(:usuarios) do |t|
      t.encryptable
    end
  end
end
