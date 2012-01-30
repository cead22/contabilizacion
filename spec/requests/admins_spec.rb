require 'spec_helper'

describe "Admins" do
  before :each do
    @admin = Usuario.create!({:email => 'cead22@cead22.com', :password => 'carlos', :password_confirmation => 'carlos', :rol => 'admin', :email => 'carlos@carlos.com'})
    @con =   Usuario.create!({:email => 'conector@cead22.com', :password => 'conector', :password_confirmation => 'conector', :rol => 'conector', :email => 'conector@conector.com'})
    @con2 =  Usuario.create!({:email => 'conector2@cead22.com', :password => 'conector2', :password_confirmation => 'conector2', :rol => 'conector', :email => 'conector2@conector2.com'})
    @obs =   Usuario.create!({:email => 'observador@cead22.com', :password => 'observador', :password_confirmation => 'observador', :rol => 'observador', :email => 'observador@observador.com'})
    
  end
  
  describe "GET /admins" do
    it "agrega un conector nuevo" do
      # login as admin
      visit centros_path
      fill_in 'Email', :with => @admin.email
      fill_in 'Password', :with => @admin.password
      click_button 'Entrar'
      
      # go to create usuario
      click_link 'Admin'
      click_link 'Usuarios'
      current_path.should == usuarios_path
      
      click_link 'Crear Usuario'
      current_path.should == crear_usuario_path
      
      # fill out the form
      # fill_in 'Nombre de usuario', :with => 'newadmin'
      fill_in 'Email', :with => 'newadmin@newadmin.com'
      fill_in 'Password', :with => 'newadmin'
      fill_in 'Password confirmation', :with => 'newadmin'
      choose 'Administrador'

      click_button 'Guardar'
      
      current_path.should == usuarios_path
      page.should have_content 'Usuario creado'
    end
    
    it "no permite acceso a observadores al area de admin" do
      # login as observador
      visit centros_path
      fill_in 'Email', :with => @obs.email
      fill_in 'Password', :with => @obs.password
      click_button 'Entrar'

      # check menu
      page.should_not have_content 'Admin'

      # go to create usuario
      visit crear_usuario_path
      current_path.should == centros_path
      page.should have_content 'No tiene permiso'
      
      # go to ver usuarios
      visit usuarios_path
      current_path.should == centros_path
      page.should have_content 'No tiene permiso'      
    end
    
    it "no permite acceso a conectores al area de admin" do
      # login as conector
      visit centros_path
      fill_in 'Email', :with => @con.email
      fill_in 'Password', :with => @con.password
      click_button 'Entrar'

      # check menu
      page.should_not have_content 'Admin'

      # go to create usuario
      visit crear_usuario_path
      current_path.should == centros_path
      page.should have_content 'No tiene permiso'
      
      # go to ver usuarios
      visit usuarios_path
      current_path.should == centros_path
      page.should have_content 'No tiene permiso'      
    end
  end
  
end
