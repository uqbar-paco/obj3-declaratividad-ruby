require_relative '../../model/alumno'
require_relative '../../model/view/view_simple_reflection'
require_relative '../spec_utils'

init_tpi
init_juan

fields = [
  :legajo,
  :nombre,
  :cantidad_materias_aprobadas
]
SimpleReflectionHtmlView.new(@juan, fields).write_html("juan.html")
SimpleReflectionConsoleView.new(@juan, fields).console_show