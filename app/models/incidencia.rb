class Incidencia < ActiveRecord::Base
  attr_accessible :centro_id, :descripcion, :hora, :anomalia_id
  has_many :tipo_incidencias
end
