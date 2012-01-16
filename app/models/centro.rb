class Centro < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :estado, :presence => true
  validates :municipio, :presence => true
  validates :parroquia, :presence => true
  has_many :llamadas
  has_many :mesas
  accepts_nested_attributes_for :mesas
end
