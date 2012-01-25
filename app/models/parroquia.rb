class Parroquia < ActiveRecord::Base
  belongs_to :municipio
  has_many :centros
end
