class Incidencia < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :tipo_incidencias
end
