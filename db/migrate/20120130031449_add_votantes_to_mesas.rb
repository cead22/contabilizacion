class AddVotantesToMesas < ActiveRecord::Migration
  def change
    add_column :mesas, :votantes, :integer
  end
end
