class Llamada < ActiveRecord::Base
  # set hora
  attr_readonly :hora
  before_validation :set_hora


  # scope
  # default_scope :order => 'hora ASC'

  # association
  belongs_to :centro

  # validations
  validates_inclusion_of :funcionando, :in => [true, false], :message => ": Debe indicar el centro esta funcionando correctamente"
  validates_inclusion_of :cerrado_forzado, :in => [true, false], :message => ": Debe indicar si el centro fue cerrado de manera forzada"
  validates :votos, :presence => {:message => ": Debe indicar el numero de personas que ha votado hasta ahora"}

  validate :votantes
  validate :votantes_llamada_anterior
  validate :votantes_llamada_siguiente
  

  # methods
  def votantes
    if votos != nil && votos != ""
      if centro.votantes < votos + centro.llamadas.map {|l| l.votos}.sum 
        errors.add :error, ": Nnumero de votantes del centro excedido (#{centro.votantes})"
      end
    end
  end

  def votantes_llamada_anterior
    if votos != nil && votos != ""
      if centro.llamadas.where("hora < ?", hora).count > 0
        votos_llamada_anterior = centro.llamadas.where("hora < ?", self.hora).order("hora DESC").first.votos
        if votos < votos_llamada_anterior
          errors.add :error, ": Numero de votos indicado es menor al numero de votos de la llamada anterior (#{votos} < #{votos_llamada_anterior})" 
        end
      end
    end
  end
  
  def votantes_llamada_siguiente
    if votos != nil && votos != ""
      if centro.llamadas.where("hora > ?", hora).count > 0
        votos_llamada_siguiente = centro.llamadas.where("hora > ?", hora).order("hora ASC").first.votos
        if votos > votos_llamada_siguiente
          errors.add :error, ": Numero de votos indicado es mayor al numero de votos de la llamada siguiente (#{votos} > #{votos_llamada_siguiente})" 
        end
      end
    end
  end

  def set_hora
    self.hora = Time.now unless self.hora != nil && self.hora != ""
  end

end
