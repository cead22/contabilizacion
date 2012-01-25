class LlamadasController < ApplicationController
  before_filter :get_llamada
  
  def modificar
    # @llamada = Llamada.find params[:id]
  end
  
  def update
    if @llamada.update_attributes params[:llamada]
      redirect_to centro_path(@llamada.centro), :flash => {:success => 'Llamada actualizado'}
    else
      redirect_to :back, :error => 'Error al actualizar llamada'
    end
  end

  private
  
  def get_llamada
    @llamada = Llamada.find params[:id]
  end

end
