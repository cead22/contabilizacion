# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120122132155) do

  create_table "LLAMADA", :force => true do |t|
    t.datetime "hora"
    t.integer  "CENTRO_id"
    t.boolean  "funcionando"
    t.integer  "votos"
    t.boolean  "cerrado_forzado"
  end

  create_table "anomalia", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_anomalia_id"
  end

  create_table "centros", :force => true do |t|
    t.string   "nombre"
    t.string   "parroquia"
    t.string   "municipio"
    t.string   "estado"
    t.time     "abrio"
    t.time     "cerro"
    t.boolean  "instalacion_correcta"
    t.boolean  "testigos_nuestros_presentes"
    t.boolean  "otros_testigos_presentes"
    t.boolean  "plan_republica_presente"
    t.integer  "votos"
    t.integer  "votantes"
    t.time     "escrutinio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidencia", :force => true do |t|
    t.integer  "centro_id"
    t.time     "hora"
    t.integer  "anomalia_id", :limit => 255
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "llamadas", :force => true do |t|
    t.datetime "hora"
    t.integer  "centro_id"
    t.boolean  "funcionando"
    t.integer  "votos"
    t.boolean  "cerrado_forzado"
  end

  create_table "mesas", :force => true do |t|
    t.integer  "numero"
    t.integer  "centro_id"
    t.integer  "votos_hc"
    t.integer  "votos_ll"
    t.integer  "votos_pp"
    t.integer  "votos_mc"
    t.integer  "votos_da"
    t.integer  "votos_pm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_anomalia", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
