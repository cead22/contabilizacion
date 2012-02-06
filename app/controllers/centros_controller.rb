class CentrosController < ApplicationController
  
  before_filter :get_centro, :except => [:index]
  before_filter :admin_o_conector, :except => [:index, :show]
  before_filter :centro_propio, :except => :index
  
  def index
    if current_usuario.rol == 'conector'
      @centros = Centro.where("usuario_id = ?",current_usuario.id)
    else
      @centros = Centro.all
    end
  end

  def show
  end
  
  def abrir_centro
    params[:centro][:abrio] = params[:centro][:abrio] == 'true' ? Time.now : nil
    
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      render :action => :abrir, :flash => {:error => 'error al actualizar centro'}
    end
  end
  
  def cerrar_centro
    params[:centro][:cerro] = params[:centro][:cerro] == 'true' ? Time.now : nil
    
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      render :action => :cerrar, :flash => {:error => 'error al actualizar centro'}
    end
  end

  # def update_control
  #   # [:abrio,:cerro,:escrutinio].each do |sym|
  #   #   params[:centro][sym] = params[:centro][sym] == 'true' ? Time.now : nil
  #   # end
  #   if @centro.update_attributes params[:centro]
  #     redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
  #   else
  #     redirect_to :back, :flash => {:error => 'error al actualizar centro'}
  #   end
  # end
    
  def update
    # [:abrio,:cerro,:escrutinio].each do |sym|
    #   params[:centro][sym] = params[:centro][sym] == 'true' ? Time.now : nil
    # end
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      @llamada = params[:centro][:llamadas_attributes] ? Llamada.new(params[:centro][:llamadas_attributes]["0"]) : @centro.class.reflect_on_association(:llamadas).klass.new
      @incidencia_form_path = 'incidencia_form'
      render :action => :control
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
      # render :action => modificar_incidencia, :error => 'Error al actualizar incidencia'
      redirect_to :back, :error => 'Error al actualizar incidencia'
    end
  end
  
  def modificar_coordinador
  end
  
  def edit_coordinador
    coordinador = Centro.find(params[:id]).coordinador
    if coordinador.update_attributes params[:coordinador]
      redirect_to centro_path(@centro), :flash => {:success => 'Coordinador Actualizado'}
    else
      render :modificar_coordinador
      # redirect_to :back, :error => 'Error al actualizar coordinador'
    end
  end

  private
  
  def get_centro
    @centro = Centro.find params[:id]
  end
  
  def centro_propio
    if current_usuario.rol == 'conector' && @centro.usuario_id != current_usuario.id
      redirect_to(centros_path, :flash => {:error => 'No puede acceder a centros de otros conectores'})
    end
  end

end
