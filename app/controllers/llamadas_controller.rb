class LlamadasController < ApplicationController
  before_filter :get_llamada
  before_filter :admin_o_conector
  
  def modificar
    @llamada = Llamada.find params[:id]
    @centro = Centro.find @llamada.centro_id
    @incidencia_form_path = 'centros/incidencia_form'
  end
  
  def update
    if @llamada.update_attributes params[:llamada]
      redirect_to centro_path(@llamada.centro), :flash => {:success => 'Llamada actualizado'}
    else
      # redirect_to :back, :error => 'Error al actualizar llamada'
      render :action => :modificar
    end
  end

  private
  
  def get_llamada
    @llamada = Llamada.find params[:id]
  end

end
