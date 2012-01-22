class Centro < ActiveRecord::Base
  # attr_accessible #none
  validates :nombre, :presence => true
  validates :estado, :presence => true
  validates :municipio, :presence => true
  validates :parroquia, :presence => true
  has_many :llamadas
  has_many :mesas
  has_many :incidencias
  accepts_nested_attributes_for :mesas
  accepts_nested_attributes_for :llamadas
  accepts_nested_attributes_for :incidencias, :reject_if => lambda { |i| i[:descripcion].blank? || i[:anomalia_id].blank?}, :allow_destroy => true
end
