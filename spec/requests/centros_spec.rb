require 'spec_helper'

describe "Centros" do
  
  before :each do
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia => 'CANDELARIA', :estado => 'CANDELARIA', :municipio => 'DTTO. CAPITAL', :votantes =>   345
    @cerrar = Centro.create :nombre => 'Nombre Centro Cerrar', :parroquia => 'CANDELARIA', :estado => 'DTTO. CAPITAL', :municipio => 'LIBERTADOR', :votantes => 123, :abrio => 'Mon Jan 16 01:38:12 -0430 2012'
    @mesa1 = Mesa.create :centro_id => @cerrar.id, :numero => 1
    @mesa2 = Mesa.create :centro_id => @cerrar.id, :numero => 2
  end
  
  describe "GET /centros" do
    it "show all centros" do
      visit centros_path
      # page.should have_content 'Centros'
      page.should have_content 'COLEGIO SAN FRANCISCO DE SALES'
      # save_and_open_page
    end
    
  
  end

  describe "PUT /centros" do
    it "guarda la informacion de la primera llamada" do
      visit centros_path
      page.should have_content 'COLEGIO SAN FRANCISCO DE SALES'
      # save_and_open_page
      click_link 'Primera Llamada'
      current_path.should == abrir_centro_path(@centro)
      
      page.should have_content '¿Abrió el centro?'
      choose('centro_abrio')
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
      # save_and_open_page     
      click_button 'Guardar'
      
      current_path.should == centro_path(@centro)
       # save_and_open_page

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
      page.should have_content '¿Cuántos votaron por HC?'
      page.should have_content '¿Cuántos votaron por LL?'
      page.should have_content '¿Cuántos votaron por PP?'
      page.should have_content '¿Cuántos votaron por MC?'
      page.should have_content '¿Cuántos votaron por DA?'
      page.should have_content '¿Cuántos votaron por PM?'
      
      choose('centro_cerro')
      choose('centro_escrutinio')
      # save_and_open_page
      fill_in 'centro_mesas_attributes_0_votos_hc', :with => 66
      fill_in 'centro_mesas_attributes_0_votos_ll', :with => 55
      fill_in 'centro_mesas_attributes_0_votos_pp', :with => 44
      fill_in 'centro_mesas_attributes_0_votos_mc', :with => 33
      fill_in 'centro_mesas_attributes_0_votos_da', :with => 22
      fill_in 'centro_mesas_attributes_0_votos_pm', :with => 11
      
      fill_in 'centro_mesas_attributes_1_votos_hc', :with => 99
      fill_in 'centro_mesas_attributes_1_votos_ll', :with => 88
      fill_in 'centro_mesas_attributes_1_votos_pp', :with => 77
      fill_in 'centro_mesas_attributes_1_votos_mc', :with => 77
      fill_in 'centro_mesas_attributes_1_votos_da', :with => 88
      fill_in 'centro_mesas_attributes_1_votos_pm', :with => 99
      
      # save_and_open_page
      click_button 'Guardar'
      # 
      current_path.should == centro_path(@cerrar)
      page.should have_content '¿Cerró el centro?'
      page.should have_content '¿Se hizo el escrutinio?'
      page.should have_content 'Votos HC'
      page.should have_content 'Votos LL'
      page.should have_content 'Votos PP'
      page.should have_content 'Votos MC'
      page.should have_content 'Votos DA'
      page.should have_content 'Votos PM'
    end
  end
end
