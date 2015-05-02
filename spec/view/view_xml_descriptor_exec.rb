require_relative '../../model/alumno'
require_relative '../../model/view/view_descriptor'
require_relative '../../model/view_xml/xml_view_descriptor'
require_relative '../spec_utils'

init_tpi
init_juan

filepath=File.expand_path('../../model/view_xml/alumno_descriptor.xml', File.dirname(__FILE__))
xml_file=File.open filepath
descriptor_alumno = ViewDescriptorFromXml.new(xml_file).descriptor

DescriptorHtmlView.new(@juan, descriptor_alumno).write_html("juan.html")
DescriptorConsoleView.new(@juan, descriptor_alumno).console_show

