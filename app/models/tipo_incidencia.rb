class TipoIncidencia < ActiveRecord::Base
  attr_accessible #none
  has_many :anomalias
  belongs_to :incidencia
end
