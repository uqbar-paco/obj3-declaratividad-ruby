require_relative '../../model/view_annotations/alumno_annotated'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view_annotations/view_annotation_based_descriptor'
require_relative '../spec_utils'

init_tpi
init_juan

DescriptorFromAnnotationHtmlView.new(@juan).write_html("c:/temp/ruby/juan.html")
DescriptorFromAnnotationConsoleView.new(@juan).console_show






=begin
prop_aprobo_intro = BlockDescriptor.new(
  "Aprobo Intro",
  Proc.new { |alu| alu.tiene_aprobada?(mat("Intro")) }
)

html = DescriptorFromAnnotationHtmlView.new(@juan)
html.descriptor.add_property(prop_aprobo_intro)
html.write_html("c:/temp/ruby/juan.html")

console = DescriptorFromAnnotationConsoleView.new(@juan)
console.descriptor.add_property(prop_aprobo_intro)
console.console_show
=end
