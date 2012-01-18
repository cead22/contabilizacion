class Anomalia < ActiveRecord::Base
  attr_accessible #none
  belongs_to :tipo_incidencia
end
