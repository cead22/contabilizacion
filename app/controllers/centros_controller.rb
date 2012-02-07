class CentrosController < ApplicationController
  
  before_filter :get_centro, :except => [:index, :modificar_incidencia, :edit_incidencia]
  before_filter :admin_o_conector, :except => [:index, :show]
  before_filter :centro_propio, :except => :index
  
  def index
    if current_usuario.rol == 'conector'
      @centros = Centro.where("usuario_id = ?",current_usuario.id).page(params[:page]).per(500)
    else
      @centros = Centro.page(params[:page]).per(500)
    end
  end

  def show
  end
  
  def abrir_centro
    # specific validation
    @centro.errors.add :abrio, ": Debe indicar si el centro abrio" unless params[:centro][:abrio] != nil && params[:centro][:abrio] != ""
    @centro.errors.add :instalacion_correcta , ": Debe indicar si se hizo la instalacion del centro correctamente" unless (params[:centro][:instalacion_correcta] != nil && params[:centro][:instalacion_correcta] != "")
    @centro.errors.add :testigos_nuestros_presentes , ": Debe indicar si nuestros testigos estan presentes" unless (params[:centro][:testigos_nuestros_presentes] != nil && params[:centro][:testigos_nuestros_presentes] != "")
    @centro.errors.add :otros_testigos_presentes , ": Debe indicar si los otros testigos estan presentes" unless (params[:centro][:otros_testigos_presentes] != nil && params[:centro][:testigos_nuestros_presentes] != "")
    @centro.errors.add :plan_republica_presente , ": Debe indicar si el plan republica esta presente" unless params[:centro][:plan_republica_presente] != nil && params[:centro][:plan_republica_presente] != ""

    params[:centro][:abrio] = params[:centro][:abrio] == 'true' ? Time.now : nil
    
    if @centro.errors.empty? && (@centro.update_attributes params[:centro])
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      @centro.attributes = params[:centro]
      render :action => :abrir, :flash => {:error => 'error al actualizar centro'}
    end
  end
  
  def cerrar_centro
    @centro.errors.add :cerro, ": Debe indicar si el centro cerro" unless params[:centro][:cerro] != nil && params[:centro][:centro] != ""
    @centro.errors.add :escrutinio , ": Debe indicar si se hizo el escrutinio" unless params[:centro][:escrutinio] != nil && params[:centro][:escrutinio] != ""
    
    @centro.mesas_attributes = params[:centro][:mesas_attributes]
    
    @centro.mesas.each_with_index{|mesa,i| mesa.save! rescue @centro.errors.add :mesas, ": Debe rellenar todos los campos de votos de la mesa \##{i+1}"}  
    
    params[:centro][:cerro] = params[:centro][:cerro] == 'true' ? Time.now : nil
    
    if @centro.errors.empty? && (@centro.update_attributes params[:centro])
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado"}
    else
      @centro.attributes = params[:centro]
      render :action => :cerrar, :flash => {:error => 'error al actualizar centro'}
    end
  end

  def update
    if @centro.update_attributes params[:centro]
      redirect_to centro_path(@centro), :flash => {:success => "centro actualizado."}
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
    @centro = @incidencia.centro
  end
  
  def edit_incidencia
    incidencia = Incidencia.find params[:id]
    if incidencia.update_attributes params[:incidencia]
      redirect_to centro_path(incidencia.centro_id), :flash => {:success => 'Incidencia actualizada'}
    else
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
