require 'spec_helper'

describe "Centros" do
  
  before :each do
    miranda = Estado.create :nombre => 'Miranda'
    baruta = Municipio.create :nombre => 'Baruta', :estado_id => miranda.id
    sart = Parroquia.create:nombre => 'Sartenejas', :municipio_id => baruta.id

    @con =   Usuario.create!({:email => 'conector@conector.com', :password => 'conector', :password_confirmation => 'conector', :rol => 'conector', :email => 'conector@conector.com'})
    @coord  = Coordinador.create({:nombre => 'Nombre Coordinador', :telefono1 => '948272224'})
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia_id => sart.id, :votantes => 345, :abrio => 'Mon Jan 16 01:38:12 -0430 2012', :usuario_id => @con.id, :coordinador_id => @coord.id
    @cerrar = Centro.create :nombre => 'Nombre Centro Cerrar', :parroquia_id => sart.id, :votantes => 123, :abrio => 'Mon Jan 16 01:38:12 -0430 2012', :usuario_id => @con.id, :coordinador_id => @coord.id
    @mesa1 = Mesa.create :centro_id => @cerrar.id, :numero => 1, :votantes => 100
    @mesa2 = Mesa.create :centro_id => @cerrar.id, :numero => 2, :votantes => 100
    
    visit centros_path
    fill_in 'Email', :with => @con.email
    fill_in 'Password', :with => @con.password
    click_button 'Entrar'
  end

  
  describe "PUT /centros" do
    it "guarda la informacion de la primera llamada" do

      visit centros_path

      page.should have_content 'COLEGIO SAN FRANCISCO DE SALES'

      click_link 'Primera Llamada'
      current_path.should == abrir_centro_path(@centro)
      
      page.should have_content '¿Abrió el centro?'
      choose('centro_abrio_true')
      # save_and_open_page
  
      page.should have_content '¿Se instaló el centro de forma correcta?'
      choose('centro_instalacion_correcta_true')
      # save_and_open_page
      
      page.should have_content '¿Se encuentran nuestros miembros y testigos?'
      choose('centro_testigos_nuestros_presentes_false')
      
      page.should have_content '¿Están los testigos de otros candidatos?'
      choose('centro_otros_testigos_presentes_false')
      
      page.should have_content '¿Llegó el Plan República?'
      choose('centro_plan_republica_presente_true')
      
      click_button 'Guardar'

      current_path.should == centro_path(@centro)
  
      page.should have_content '¿Abrió el centro?'
      find('#centro_abrio').text == 'Sí'
  
      page.should have_content '¿Se instaló el centro de forma correcta?'
      find('#centro_instalacion_correcta').text == 'Sí'
  
      page.should have_content '¿Se encuentran nuestros miembros y testigos?'
      find('#centro_testigos_nuestros_presentes').text == 'No'
  
      page.should have_content '¿Están los testigos de otros candidatos?'
      find('#centro_otros_testigos_presentes').text == 'No'
  
      page.should have_content '¿Llegó el Plan República?'
      find('#centro_plan_republica_presente').text == 'Sí'
      # save_and_open_page
    end
    
    it 'cierra el centro' do
      visit centros_path
      # save_and_open_page
      click_link "tercera_llamada_#{@cerrar.id}"
      current_path.should == cerrar_centro_path(@cerrar)
      
      page.should have_content 'Nombre Centro Cerrar'
      
      page.should have_content '¿Cerró el centro?'
      page.should have_content '¿Se hizo el escrutinio?'
      # save_and_open_page
      page.should have_content 'Votos HC'
      page.should have_content 'Votos LL'
      page.should have_content 'Votos PP'
      page.should have_content 'Votos MC'
      page.should have_content 'Votos DA'
      page.should have_content 'Votos PM'
      
      choose('centro_cerro_true')
      choose('centro_escrutinio_false')
      # save_and_open_page
      fill_in 'centro_mesas_attributes_0_votos_hc', :with => 6
      fill_in 'centro_mesas_attributes_0_votos_ll', :with => 5
      fill_in 'centro_mesas_attributes_0_votos_pp', :with => 4
      fill_in 'centro_mesas_attributes_0_votos_mc', :with => 3
      fill_in 'centro_mesas_attributes_0_votos_da', :with => 2
      fill_in 'centro_mesas_attributes_0_votos_pm', :with => 11
      fill_in 'centro_mesas_attributes_0_votos_blancos', :with => 2
      fill_in 'centro_mesas_attributes_0_votos_nulos', :with => 1
      
      fill_in 'centro_mesas_attributes_1_votos_hc', :with => 9
      fill_in 'centro_mesas_attributes_1_votos_ll', :with => 8
      fill_in 'centro_mesas_attributes_1_votos_pp', :with => 7
      fill_in 'centro_mesas_attributes_1_votos_mc', :with => 7
      fill_in 'centro_mesas_attributes_1_votos_da', :with => 8
      fill_in 'centro_mesas_attributes_1_votos_pm', :with => 9
      fill_in 'centro_mesas_attributes_1_votos_blancos', :with => 2
      fill_in 'centro_mesas_attributes_1_votos_nulos', :with => 1
      
      # save_and_open_page
      click_button 'Guardar'
      # save_and_open_page
      current_path.should == centro_path(@cerrar)
      page.should have_content '¿Cerró el centro?'
      page.should have_content '¿Se hizo el escrutinio?'
      page.should have_content 'Votos HC'
      page.should have_content 'Votos LL'
      page.should have_content 'Votos PP'
      page.should have_content 'Votos MC'
      page.should have_content 'Votos DA'
      page.should have_content 'Votos PM'
      # save_and_open_page
    end
  end
  
end
