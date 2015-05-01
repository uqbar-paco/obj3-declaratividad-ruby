require_relative '../../model/view/view_imperativo'
require_relative '../spec_utils'

init_tpi
init_juan

AlumnoHtmlView.new(@juan).write_html("c:/temp/ruby/juan.html")
AlumnoConsoleView.new(@juan).console_show