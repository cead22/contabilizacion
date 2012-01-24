class ProductionHeroku < ActiveRecord::Migration
  def up
    create_table "llamada", :force => true do |t|
      t.datetime "hora"
      t.integer  "centro_id"
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

    create_table "usuarios", :force => true do |t|
      t.string   "email",                                 :default => "", :null => false
      t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                         :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "password_salt"
    end

    add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
    add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true
    
  end

  def down
  end
end
