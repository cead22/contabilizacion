class RemoveUsernameFromUsuarios < ActiveRecord::Migration
  def up
    remove_column :usuarios, :username
  end

  def down
    add_column :usuarios, :username, :string
  end
end
