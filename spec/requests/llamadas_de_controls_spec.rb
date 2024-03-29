require 'spec_helper'

describe "LlamadasDeControls" do

  before :each do
    miranda = Estado.create :nombre => 'Miranda'
    baruta = Municipio.create :nombre => 'Baruta', :estado_id => miranda.id
    sart = Parroquia.create:nombre => 'Sartenejas', :municipio_id => baruta.id

    @coord  = Coordinador.create({:nombre => 'Nombre Coordinador', :telefono1 => '948272224'})
    @con =   Usuario.create!({:email => 'conector@conector.com', :password => 'conector', :password_confirmation => 'conector', :rol => 'conector', :email => 'conector@conector.com'})    
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia_id => sart.id, :votantes => 180, :abrio => 'Mon Jan 16 01:38:12 -0430 2012', :usuario_id => @con.id, :coordinador_id => @coord.id

    visit centros_path
    fill_in 'Email', :with => @con.email
    fill_in 'Password', :with => @con.password

    click_button 'Entrar'

  end


  describe "PUT /llamadas_de_controls" do
    it "guarda la informacion de la segunda llamada sin observaciones" do
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      page.should have_content '¿El centro está funcionando correctamente?'
      page.should have_content '¿Cuántas personas han votado?'
      page.should have_content '¿Cerraron el centro de manera forzada?'

      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 123
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')

      current_path.should == centro_path(@centro)
      page.should have_content '¿El centro está funcionando correctamente?'
      page.should have_content '¿Cuántas personas han votado?'
      page.should have_content '¿Cerraron el centro de manera forzada?'
    end

    it "trata de crear una llamada de control con mas votos de los votantes del centro" do
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 50000
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')
      # save_and_open_page


      # current_path.should == centro_control_path(@centro)
      page.should have_content 'error'
    end

    it "trata de crear llamadas y la suma de sus votos excede los votantes del centro" do
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 100
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')
      # save_and_open_page

      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 100
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')
      # save_and_open_page

      # current_path.should == centro_control_path(@centro)
      page.should have_content 'error'
    end

    it "trata de crear una llamada de control con menos votos que la llamada anterior" do
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 10
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')

      # segunda llamada
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      choose('centro_llamadas_attributes_0_funcionando_false')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 5
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')      
      click_button('Guardar')

      # current_path.should == centro_control_path(@centro)
      page.should have_content 'error'
    end

    it "trata de modificar una llamada poniendole mas votos que la llamada siguiente" do
      @llamada1 = Llamada.create :hora => Time.now, :funcionando => true, :centro_id => @centro.id, :cerrado_forzado => false, :votos => 20
      @llamada2 = Llamada.create :hora => Time.now, :funcionando => true, :centro_id => @centro.id, :cerrado_forzado => false, :votos => 30
      visit modificar_llamada_path(@llamada1)
      
      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 50
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')
      
      click_button('Guardar')
      page.should have_content 'error'
    end
  end
end
