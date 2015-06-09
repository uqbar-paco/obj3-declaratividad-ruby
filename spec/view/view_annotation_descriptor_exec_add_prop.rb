require_relative '../../model/view_annotations/alumno_annotated'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view/view_descriptor'
require_relative '../../model/view_annotations/annotation_view_descriptor'
require_relative '../spec_utils'

=begin
Html and console view specified by the annotation in the annotated version of the
Alumno class, where an additional property is added to the annotation-based descriptor.
=end

init_tpi
init_juan

prop_aprobo_intro = BlockDescriptor.new(
  Proc.new { |alu| alu.tiene_aprobada?(mat("Intro"))} ,
  "Aprobo Intro"
)

descriptor = ViewDescriptorFromAnnotation.new(Alumno).descriptor
descriptor.add_property(prop_aprobo_intro)

DescriptorHtmlView.new(@juan, descriptor).write_html("juan.html")
DescriptorConsoleView.new(@juan, descriptor).console_show