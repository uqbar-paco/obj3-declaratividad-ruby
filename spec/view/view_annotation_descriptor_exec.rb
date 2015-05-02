require_relative '../../model/view_annotations/alumno_annotated'
require_relative '../../model/alumno_agregados'
require_relative '../../model/view/view_descriptor'
require_relative '../../model/view_annotations/annotation_view_descriptor'
require_relative '../spec_utils'

init_tpi
init_juan

descriptor_alumno = ViewDescriptorFromAnnotation.new(Alumno).descriptor

DescriptorHtmlView.new(@juan, descriptor_alumno).write_html("juan.html")
DescriptorConsoleView.new(@juan, descriptor_alumno).console_show


descriptor_materia = ViewDescriptorFromAnnotation.new(Materia).descriptor

DescriptorHtmlView.new(mat("Intro"), descriptor_materia).write_html("intro.html")
DescriptorConsoleView.new(mat("Intro"), descriptor_materia).console_show
