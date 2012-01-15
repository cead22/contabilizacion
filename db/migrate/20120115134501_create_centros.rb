class CreateCentros < ActiveRecord::Migration
  def change
    create_table :centros do |t|
      t.column :nombre, :string
      t.column :parroquia, :string
      t.column :municipio, :string
      t.column :estado, :string
      t.column :abrio, :time
      t.column :cerro, :time
      t.column :instalacion_correcta, :boolean
      t.column :testigos_nuestros_presentes, :boolean
      t.column :otros_testigos_presentes, :boolean
      t.column :plan_republica_presente, :boolean
      t.column :votos, :integer
      t.column :votantes, :integer
      t.column :escrutinio, :time
      t.timestamps
    end
  end
end
