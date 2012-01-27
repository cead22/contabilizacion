class RolDefaultConector < ActiveRecord::Migration
  def change
    change_column :usuarios, :rol, :string, :default => 'conector'
  end
end
