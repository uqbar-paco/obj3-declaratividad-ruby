require_relative '../../model/view_dsl/alumno_dsl'
require_relative '../../model/view/view_descriptor'
require_relative '../spec_utils'

=begin
Html and console views specified by the simple DSL defined in the DesciptorDslSupport module.
Cfr. descriptor_dsl_support.rb
=end

init_tpi
init_juan

# this is the ideal form of the DSL
=begin
property "legajo" label "Nro legajo"
property "nombre"
block {...} label "Aprobo intro"
=end

# this is what we could do using some Ruby features
descriptor_alumno = Alumno.build_descriptor do
  property :legajo ; label "Nro legajo"
  property :nombre
  block  { |alu|
    not (alu.materias_aprobadas.detect {|m| m.nombre == "Intro"}.nil?)
  } ; label "Aprobo intro"
end

DescriptorHtmlView.new(@juan, descriptor_alumno).write_html("juan.html")
DescriptorConsoleView.new(@juan, descriptor_alumno).console_show


