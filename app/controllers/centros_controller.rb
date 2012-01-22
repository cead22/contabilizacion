class CentrosController < ApplicationController
  
  before_filter :get_centro, :except => [:index]
  
  def index
    @centros = Centro.all
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => 'centro actualizado'}
    else
      redirect_to :back, :error => 'error al actualizar centros'
    end
  end
  
  def abrir
  end
  
  def cerrar    
  end

  def control
  end
    

  private
  
  def get_centro
    @centro = Centro.find params[:id]
  end

end
