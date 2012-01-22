class Anomalia < ActiveRecord::Base
  attr_accessible :tipo_anomalia_id, :descripcion
  has_many :incidencias
  belongs_to :tipo_anomalia
end
