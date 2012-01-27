class AdminsController < ApplicationController
  before_filter :admin
  
  def usuarios
    @conectores = Usuario.where("rol = 'conector'")
    @administradores = Usuario.where("rol = 'admin'")
    @observadores = Usuario.where("rol = 'observador'")
  end

  def crear_usuario
  end

  def new_usuario
    usuario = Usuario.new params[:usuario]
    if usuario.save
      redirect_to usuarios_path, :flash => {:success => 'Usuario creado'}
    else
      redirect_to :back, :flash => {:error => 'Error al crear usuario'}
    end
  end

  def reasignar_centros
    @conectores = Usuario.where("rol = 'conector'")
  end
  
  def reasignar_centros_del_conector
    unless (@conector = Usuario.find_by_id(params[:id])) && @conector.rol == 'conector'
        redirect_to :back, :flash => {:error => 'Número de conector incorrecto'}
    end
  end
  
  def asignar_centro_a_conector
    @centro = Centro.find params[:id]
  end
  
  def update_centro
    centro = Centro.find params[:id]
    if centro.update_attributes params[:centro]
      redirect_to reasignar_centros_path, :flash => {:success => "Centro #{centro.nombre} asignado a Conector \##{centro.usuario.id}"}
    else
      redirect_to :back, :flash => {:error => 'Ocurrió un error al actualizar el centro'}
    end
  end
end
