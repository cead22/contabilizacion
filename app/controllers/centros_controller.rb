class CentrosController < ApplicationController
  def index
    @centros = Centro.all
  end

  def show
    @centro = Centro.find params[:id]
  end
  
  def edit
    @centro = Centro.find params[:id]
  end
  
  def update
    centro = Centro.find params[:id]
    
    if centro.update_attributes params[:centro]
      redirect_to centro_path(centro), :notice => 'centro actualizado'
    else
      redirect_to :back, :notice => 'error al actualizar centros'
    end
  end
  
  def abrir
    @centro = Centro.find params[:id]
  end

end
