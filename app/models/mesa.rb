class Mesa < ActiveRecord::Base
  # include ActiveModel::MesaValidator
  belongs_to :centro
  default_scope :order => 'numero ASC'
  validate :votantes_validation, :on => :update
  validates :votos_hc, :presence => true, :on => :update
  validates :votos_ll, :presence => true, :on => :update
  validates :votos_pp, :presence => true, :on => :update
  validates :votos_mc, :presence => true, :on => :update
  validates :votos_da, :presence => true, :on => :update
  validates :votos_pm, :presence => true, :on => :update
  validates :votos_blancos, :presence => true, :on => :update
  validates :votos_nulos, :presence => true, :on => :update

  def votantes_validation
    if votos?
      unless votos < votantes
        errors.add :error, ": Numero de votos de la mesa \##{numero} excede numero de votantes (#{votantes})"
      end
    end
  end
  
  def votos
    votos_hc + votos_ll + votos_pp + votos_mc + votos_da + votos_pm + votos_blancos + votos_nulos
  end
  
  def votos?
    votos_hc && votos_pp && votos_ll && votos_mc && votos_da && votos_pm && votos_blancos && votos_nulos
  end
end
