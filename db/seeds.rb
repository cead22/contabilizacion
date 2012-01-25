# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# miranda = Estado.create :id => 1, :nombre => 'Miranda'
# baruta = Municipio.create :id => 1, :nombre => 'Baruta', :estado_id => miranda.id
# sartenejas = Parroquia.create :id => 1, :nombre => 'Sartenejas', :municipio_id => baruta.id

ccs = Estado.create :nombre => 'Dtto. Capital'
libertador = Municipio.create :nombre => 'Libertador', :estado_id => ccs.id
sucre = Parroquia.create :nombre => 'Sucre', :municipio_id => libertador.id

# usb = Centro.create :nombre => 'Universidad Simón Bolívar', :parroquia_id => sartenejas.id, :votantes => 500
# Mesa.create :numero => 1, :centro_id => usb.id
# Mesa.create :numero => 2, :centro_id => usb.id
# Mesa.create :numero => 3, :centro_id => usb.id

# ucv = Centro.create :nombre => 'Universidad Central de Venezuela', :parroquia_id => rosalia.id, :votantes => 950

c1 = Centro.create :nombre => 'LICEO BOLIVARIANO JUAN DE GURRUCEAGA', :parroquia_id => sucre, :votantes => 350
Mesa.create :numero => 1, :centro_id => c1.id
Mesa.create :numero => 2, :centro_id => c1.id
Mesa.create :numero => 3, :centro_id => c1.id

c2 = Centro.create :nombre => 'UNIDAD EDUCATIVA BOLIVARIANA CARDENAL QUINTERO', :parroquia_id => sucre, :votantes => 400
Mesa.create :numero => 1, :centro_id => c2.id
Mesa.create :numero => 2, :centro_id => c2.id

c3 = Centro.create :nombre => 'CENTRO EDUCATIVO LA INMACULADA', :parroquia_id => sucre, :votantes => 520
Mesa.create :numero => 1, :centro_id => c3.id
Mesa.create :numero => 2, :centro_id => c3.id
Mesa.create :numero => 3, :centro_id => c3.id
Mesa.create :numero => 4, :centro_id => c3.id

c4 = Centro.create :nombre => 'UNIDAD EDUCATIVA DISTRITAL LUIS ANTONIO PADRINO', :parroquia_id => sucre, :votantes => 180
Mesa.create :numero => 1, :centro_id => c4.id
Mesa.create :numero => 2, :centro_id => c4.id

c5 = Centro.create :nombre => 'UNIDAD EDUCATIVA COLEGIO PARROQUIAL LA SAGRADA FAMILIA.', :parroquia_id => sucre, :votantes => 980
Mesa.create :numero => 1, :centro_id => c5.id
Mesa.create :numero => 2, :centro_id => c5.id
Mesa.create :numero => 3, :centro_id => c5.id

c6 = Centro.create :nombre => 'UNIDAD EDUCATIVA DISTRITAL GUSTAVO LEDO', :parroquia_id => sucre, :votantes => 870
Mesa.create :numero => 1, :centro_id => c6.id
Mesa.create :numero => 2, :centro_id => c6.id

retraso = TipoAnomalia.create :descripcion => 'Restraso en la apertura'
['Falta de material', 'Falta de miembros de mesa','Equipos dañados','Por los testigos de algún candidato','Por grupos armados','Por la Guardia Nacional','Otra'].each do |a|
  Anomalia.create :descripcion => a, :tipo_anomalia_id => retraso.id
end
   
malfun = TipoAnomalia.create :descripcion => 'Mal funcionamiento del centro'
['Falla de equipos', 'Falla eléctrica', 'Problemas logísticos', 'Paso a proceso manual', 'Otra'].each do |a|
  Anomalia.create :descripcion => a, :tipo_anomalia_id => malfun.id
end

cierre = TipoAnomalia.create :descripcion => 'Cierre forzado del centro'
['Por los testigos de algún candidato','Por grupos armados','Por la Guardia Nacional','Otra'].each do |a|
  Anomalia.create :descripcion => a, :tipo_anomalia_id => cierre.id
end

irreg = TipoAnomalia.create :descripcion => 'Irregularidades en la jornada'
['Múltiples votos por una sola persona', 'Papeletas que no corresponden con lo seleccionado en la máquina', 'Relativas a la propaganda', 'Retirada forzada de testigos de algún grupo','Otra'].each do |a|
  Anomalia.create :descripcion => a, :tipo_anomalia_id => irreg.id
end

apertura = TipoAnomalia.create :descripcion => 'Apertura forzada del centro luego del cierre'
['Por los testigos de algún candidato','Por grupos armados','Por la Guardia Nacional','Otra'].each do |a|
  Anomalia.create :descripcion => a, :tipo_anomalia_id => apertura.id
end
