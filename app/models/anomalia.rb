class Anomalia < ActiveRecord::Base
  attr_accessible :tipo_anomalia_id, :descripcion
  belongs_to :tipo_incidencia
end
