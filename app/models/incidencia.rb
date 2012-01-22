class Incidencia < ActiveRecord::Base
  attr_accessible :centro_id, :descripcion, :hora, :anomalia_id
  belongs_to :anomalia
end
