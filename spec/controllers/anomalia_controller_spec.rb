require 'spec_helper'

describe AnomaliaController do

  describe "GET 'actualizar_anomalias'" do
    it "returns http success" do
      get 'actualizar_anomalias'
      response.should be_success
    end
  end

end
