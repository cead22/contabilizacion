require 'spec_helper'

describe "LlamadasDeControls" do
  
  before :each do
    @centro = Centro.create :nombre => 'COLEGIO SAN FRANCISCO DE SALES', :parroquia => 'CANDELARIA', :estado => 'CANDELARIA', :municipio => 'DTTO. CAPITAL', :votantes =>   345, :abrio => 'Mon Jan 16 01:38:12 -0430 2012'
  end
  
  describe "PUT /llamadas_de_controls" do
    it "guarda la informacion de la segunda llamada sin observaciones" do
      visit centros_path
      click_link 'Llamada de Control'
      current_path.should == centro_control_path(@centro)

      page.should have_content '¿El centro está funcionando correctamente?'
      page.should have_content '¿Cuántas personas han votado?'
      page.should have_content '¿Cerraron el centro de manera forzada?'

      # save_and_open_page
      choose('centro_llamadas_attributes_0_funcionando_true')
      fill_in 'centro_llamadas_attributes_0_votos', :with => 123
      # save_and_open_page
      choose('centro_llamadas_attributes_0_cerrado_forzado_true')
      
      click_button('Guardar')
      current_path.should == centro_path(@centro)
      page.should have_content '¿El centro está funcionando correctamente?'
      page.should have_content '¿Cuántas personas han votado?'
      page.should have_content '¿Cerraron el centro de manera forzada?'
      # find('#funcionando').text == 'Sí'
      # find('#votos').text == '123'
      # find('#cerrado_forzado').text == 'No'
      # save_and_open_page
    end
  end
end
