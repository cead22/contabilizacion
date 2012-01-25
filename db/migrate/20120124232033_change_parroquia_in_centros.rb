class ChangeParroquiaInCentros < ActiveRecord::Migration
  def up
    remove_column :centros, :parroquia
    add_column :centros, :parroquia_id, :integer
  end

  def down
    # rename_column :centros, :parroquia_id, :parroquia
    # change_column :centros, :parroquia, :string
  end
end
