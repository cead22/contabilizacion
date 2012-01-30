class Mesa < ActiveRecord::Base
  belongs_to :centro
  default_scope :order => 'numero ASC'
end
