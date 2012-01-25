require 'spec_helper'

describe LlamadasController do

  describe "GET 'modificar'" do
    it "returns http success" do
      get 'modificar'
      response.should be_success
    end
  end

end
