require 'spec_helper'

describe "AdminCentros" do
  before :each do
    @admin = Usuario.create!({:email => 'cead22@cead22.com', :password => 'carlos', :password_confirmation => 'carlos', :rol => 'admin', :email => 'carlos@carlos.com'})
    @con =   Usuario.create!({:email => 'conector@cead22.com', :password => 'conector', :password_confirmation => 'conector', :rol => 'conector', :email => 'conector@conector.com'})
    @con2 =  Usuario.create!({:email => 'conector2@cead22.com', :password => 'conector2', :password_confirmation => 'conector2', :rol => 'conector', :email => 'conector2@conector2.com'})
    @obs =   Usuario.create!({:email => 'observador@cead22.com', :password => 'observador', :password_confirmation => 'observador', :rol => 'observador', :email => 'observador@observador.com'})
    miranda = Estado.create :nombre => 'Miranda'
    baruta = Municipio.create :nombre => 'Baruta', :estado_id => miranda.id
    sart = Parroquia.create:nombre => 'Sartenejas', :municipio_id => baruta.id
    
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia_id => sart.id, :votantes => 345, :abrio => 'Mon Jan 16 01:38:12 -0430 2012', :usuario_id => @con.id
    @centro2 = Centro.create :nombre => 'COLEGIO DE PRUEBA', :parroquia_id => sart.id, :votantes => 325, :abrio => 'Mon Jan 16 01:38:12 -0430 2012', :usuario_id => @con2.id
  end
  
  describe "GET /admin_centros" do
    it "reasigna centros" do

      # login as admin
      visit centros_path
      fill_in 'Email', :with => @admin.email
      fill_in 'Password', :with => @admin.password
      click_button 'Entrar'
      
      # go to reasignar
      click_link 'Admin'
      click_link 'Reasignar Centros'
      current_path.should == reasignar_centros_path
      
      # search conector
      fill_in 'id', :with => @con2.id
      click_button 'Ver centros del conector'
      current_path.should == reasignar_centros_del_conector_path

      # select asignar a otro conector
      click_link 'Asignar a otro conector'
      
      # select new conector
      select 'conector', :from => 'centro_usuario_id'
      click_button 'Asignar'
      
      # success flash
      page.should have_content 'asignado a Conector'
    end
  end
end