require_relative '../../model/view_annotations/alumno_annotated'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view/view_descriptor'
require_relative '../../model/view_annotations/annotation_view_descriptor'
require_relative '../spec_utils'

init_tpi
init_juan

descriptor = ViewDescriptorFromAnnotation.new(Alumno).descriptor

DescriptorHtmlView.new(@juan, descriptor).write_html("juan.html")
DescriptorConsoleView.new(@juan, descriptor).console_show