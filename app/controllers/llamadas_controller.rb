class LlamadasController < ApplicationController
  def index
  end
  
  def new
    @centro = Centro.find params[:id]
    @llamada = Llamada.new
  end

  def create
    centro_id = params[:centro]
    @llamada = Llamada.new params[:llamada]
    @llamada[:centro_id] = centro_id
    if @llamada.save
      @centro = Centro.find centro_id
      redirect_to centro_path(@centro), :flash => {:success => 'llamada guardada'}
    else
      redirect_to :back, :flash => {:error => 'error al guardar llamada'}
    end
  end

end
