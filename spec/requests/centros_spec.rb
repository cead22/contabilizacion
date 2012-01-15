require 'spec_helper'

describe "Centros" do
  
  before :each do
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia => 'CANDELARIA', :estado => 'CANDELARIA', :municipio => 'DTTO. CAPITAL', :votantes =>   345
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
    it "primera llamada" do
      visit centros_path
      page.should have_content 'COLEGIO SAN FRANCISCO DE SALES'
      # save_and_open_page
      click_link 'Primera Llamada'
      current_path.should == abrir_centro_path(@centro)
      
      page.should have_content '¿Abrió el centro?'
      choose('centro_abrio')

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
       # save_and_open_page
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
  end
  
  # describe "GET /centro" do
  #   it  "muestra un centro" do
  #     visit centros_path
  #     click_link 'Mostrar'
  #     current_path.should == centro_path(@centro)
  #     page.should have_content 'COLEGIO SAN FRANCISCO DE SALES'
  #     page.should have_content 'Votantes'
  #     save_and_open_page
  #   end
  # end
  
end
