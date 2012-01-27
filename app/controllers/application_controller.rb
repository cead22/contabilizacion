# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_usuario!
  
  def admin_o_conector
    unless rol('admin') || rol('conector')
      redirect_to centros_path, :flash => {:error => 'No tiene permiso para acceder a la página'}
    end  
  end
  
  def admin
    unless rol('admin')
      redirect_to centros_path, :flash => {:error => 'No tiene permiso para acceder a la página'}
    end  
  end

  def rol(rol)
    usuario_signed_in? && current_usuario.rol == rol
  end
  
end
