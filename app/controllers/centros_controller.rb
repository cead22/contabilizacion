class CentrosController < ApplicationController
  
  before_filter :get_centro, :except => [:index]
  before_filter :admin_o_conector, :except => [:index, :show]
  
  def index
    @centros = Centro.all
  end

  def show
  end
  
  def update
    [:abrio,:cerro,:escrutinio].each do |sym|
      params[:centro][sym] = params[:centro][sym] == 'true' ? Time.now : nil
    end
    
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      redirect_to :back, :error => 'error al actualizar centros'
    end
  end
  
  def abrir
  end
  
  def cerrar    
  end

  def control
    @llamada = @centro.class.reflect_on_association(:llamadas).klass.new
    @incidencia_form_path = 'incidencia_form'
  end
    
  def modificar_incidencia
    @incidencia = Incidencia.find params[:id]
  end
  
  def edit_incidencia
    incidencia = Incidencia.find params[:id]
    if incidencia.update_attributes params[:incidencia]
      redirect_to centro_path(incidencia.centro_id), :flash => {:success => 'Incidencia actualizada'}
    else
      redirect_to :back, :error => 'Error al actualizar incidencia'
    end
  end

  private
  
  def get_centro
    @centro = Centro.find params[:id]
  end

end
