class Incidencia < ActiveRecord::Base
  attr_protected :hora
  attr_accessible :centro_id, :descripcion,  :anomalia_id
  
  belongs_to :anomalia
  belongs_to :centro
end
