require_relative '../../model/alumno'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view/view_descriptor'
require_relative '../spec_utils'

init_tpi
init_juan

prop_cant_materias_aprobadas = PropertyDescriptor.new(:cantidad_materias_aprobadas)
prop_cant_materias_aprobadas.label = 'Cant. materias aprobadas'

prop_aprobo_intro = BlockDescriptor.new(
    "Aprobo Intro",
    Proc.new { |alu| alu.tiene_aprobada?(mat("Intro")) }
)

descriptor = ClassDescriptor.new(
    Alumno,
    :legajo,
    :nombre,
    prop_cant_materias_aprobadas,
    prop_aprobo_intro
)

DescriptorHtmlView.new(@juan, descriptor).write_html("c:/temp/ruby/juan.html")
DescriptorConsoleView.new(@juan, descriptor).console_show