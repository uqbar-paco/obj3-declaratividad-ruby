require_relative '../../model/view/view_imperativo'
require_relative '../spec_utils'

=begin
Html and console views programmatically defined.
=end

init_tpi
init_juan

AlumnoHtmlView.new(@juan).write_html("juan.html")
AlumnoConsoleView.new(@juan).console_show