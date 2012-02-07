class LlamadasController < ApplicationController
  before_filter :get_llamada
  before_filter :admin_o_conector
  
  def modificar
  end
  
  def update
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => 'Llamada actualizada'}
    else
      render :controller => :llamadas, :action => :modificar
    end
  end

  private
  
  def get_llamada
    @llamada = Llamada.find params[:id]
    @centro = Centro.find @llamada.centro_id
    @incidencia_form_path = 'centros/incidencia_form'
  end

end
