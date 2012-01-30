class AddNumeroToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :numero, :integer
  end
end
