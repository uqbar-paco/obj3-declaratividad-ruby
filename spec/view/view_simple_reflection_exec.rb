require_relative '../../model/alumno'
require_relative '../../model/view/view_simple_reflection'
require_relative '../spec_utils'

init_tpi
init_juan

fieldsJuan = [
  :legajo,
  :nombre,
  :cantidad_materias_aprobadas
]
SimpleReflectionHtmlView.new(@juan, fieldsJuan).write_html("juan.html")
SimpleReflectionConsoleView.new(@juan, fieldsJuan).console_show

fieldsIntro = [ :nombre, :es_basica? ]
SimpleReflectionHtmlView.new(mat("Intro"), fieldsIntro).write_html("intro.html")
SimpleReflectionConsoleView.new(mat("Intro"), fieldsIntro).console_show
