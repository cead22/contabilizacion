class JavascriptsController < ApplicationController
  def anomalias
    @anomalias = Anomalia.all
    respond_to do |format|
      format.js  {render :content_type => 'text/javascript'}
      format.html
    end  
  end
end
