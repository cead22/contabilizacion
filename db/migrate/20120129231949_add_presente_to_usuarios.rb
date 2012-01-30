class AddPresenteToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :presente, :boolean
  end
end
