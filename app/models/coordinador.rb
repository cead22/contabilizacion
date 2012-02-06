class Coordinador < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :telefono1, :presence => true, :format => {:with => /^\d{9,12}$/i}, :uniqueness => true

  has_many :centros
end
