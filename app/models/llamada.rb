class Llamada < ActiveRecord::Base
  # set hora
  before_validation :set_hora

  default_scope :order => 'hora ASC'

  # association
  belongs_to :centro

  # validations
  validates_inclusion_of :funcionando, :in => [true, false], :message => ": Debe indicar el centro esta funcionando correctamente"
  validates_inclusion_of :cerrado_forzado, :in => [true, false], :message => ": Debe indicar si el centro fue cerrado de manera forzada"
  validates :votos, :presence => {:message => ": Debe indicar el numero de personas que ha votado hasta ahora"}

  validate :votantes
  validate :votantes_llamada_anterior

  # methods
  def votantes
    if centro.votantes < votos + centro.llamadas.map {|l| l.votos}.sum 
      errors.add :error, ": Nnumero de votantes del centro excedido (#{centro.votantes})"
    end
  end

  def votantes_llamada_anterior
    puts self.hora
    if centro.llamadas.where("hora < ?", hora).count > 0
      votos_llamada_anterior = centro.llamadas.where("hora < ?", hora).order("hora DESC").first.votos
      if votos < votos_llamada_anterior
        errors.add :error, ": Numero de votos indicado es menor al numero de votos de la llamada anterior (#{votos} < #{votos_llamada_anterior})" 
      end
    end
  end

  def set_hora
    self.hora = Time.now
  end

end
