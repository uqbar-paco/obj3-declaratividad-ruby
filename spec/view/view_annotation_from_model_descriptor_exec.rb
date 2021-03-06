require_relative '../../model/view_annotations/alumno_annotated'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view_annotations/view_annotation_based_descriptor'
require_relative '../spec_utils'

=begin
Html and console view specified by the annotation in the annotated version of the
Alumno class. In this case, the view knows how to obtain the description
from the annotations.
=end

init_tpi
init_juan

DescriptorFromAnnotationHtmlView.new(@juan).write_html("juan.html")
DescriptorFromAnnotationConsoleView.new(@juan).console_show






=begin
prop_aprobo_intro = BlockDescriptor.new(
  "Aprobo Intro",
  Proc.new { |alu| alu.tiene_aprobada?(mat("Intro")) }
)

html = DescriptorFromAnnotationHtmlView.new(@juan)
html.descriptor.add_property(prop_aprobo_intro)
html.write_html("juan.html")

console = DescriptorFromAnnotationConsoleView.new(@juan)
console.descriptor.add_property(prop_aprobo_intro)
console.console_show
=end
