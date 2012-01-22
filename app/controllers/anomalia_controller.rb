class AnomaliaController < ApplicationController
  def actualizar_anomalias
    anomalias = Anomalia.where(:tipo_anomalia_id => params[:id]).order(:name) unless params[:id].blank?
    render :partial => "centros/anomalia", :locals => { :anomalia => anomalias }
    # render :text => 'blah'
  end
end
