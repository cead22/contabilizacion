module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => ['btn', 'small'])
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    # fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    # fields = f.fields_for(association, Incidencia.new, :child_index => "new_#{association}") do |builder|
    fields = render("centros/" + association.to_s.singularize + "_form", :f => f)
    # end
    # link_to_function(name, h("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")") 
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def add_disabled
    current_usuario.rol == 'observador' ? ['disabled'] : []
  end
  
  def es_observador?
    current_usuario.rol == 'observador'
  end
end
