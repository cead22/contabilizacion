require 'spec_helper'

describe "Roles" do
  
  before :each do
    miranda = Estado.create :nombre => 'Miranda'
    baruta = Municipio.create :nombre => 'Baruta', :estado_id => miranda.id
    sart = Parroquia.create:nombre => 'Sartenejas', :municipio_id => baruta.id  
    @admin = Usuario.create!({:username => 'cead22', :password => 'carlos', :password_confirmation => 'carlos', :rol => 'admin', :email => 'carlos@carlos.com'})
    @con =   Usuario.create!({:username => 'conector', :password => 'conector', :password_confirmation => 'conector', :rol => 'conector', :email => 'conector@conector.com'})
    # @con2 =  Usuario.create!({:username => 'conector2', :password => 'conector2', :password_confirmation => 'conector2', :rol => 'conector', :email => 'conector2@conector2.com'})
    @obs =   Usuario.create!({:username => 'observador', :password => 'observador', :password_confirmation => 'observador', :rol => 'observador', :email => 'observador@observador.com'})
    
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia_id => sart.id, :votantes => 345, :abrio => 'Mon Jan 16 01:38:12 -0430 2012'  
  end
  
  describe "GET /roles" do
    it "Iniciar sesion como administrador" do
      # login
      visit centros_path
      fill_in 'Nombre de usuario', :with => @admin.username
      fill_in 'Password', :with => @admin.password
      click_button 'Entrar'
      
      # admin
      page.should have_content 'Admin'
    end
    
    it "Iniciar sesion como conector y no ver menu admin" do
      # login
      visit centros_path
      fill_in 'Nombre de usuario', :with => @con.username
      fill_in 'Password', :with => @con.password
      click_button 'Entrar'
      
      # admin
      page.should_not have_content 'Admin'
    end
    
    it "Iniciar sesion como observador y no ver menu admin ni enlaces para llamadas" do
      # login
      visit centros_path
      fill_in 'Nombre de usuario', :with => @obs.username
      fill_in 'Password', :with => @obs.password
      click_button 'Entrar'
      
      # admin
      page.should_not have_content 'Admin'
      page.should_not have_content 'Primera Llamada'
      
      visit abrir_centro_path(@centro)

      current_path.should == centros_path
      page.should have_content 'No tiene permiso'
    end
  end
end
