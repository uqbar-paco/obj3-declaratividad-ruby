require_relative '../facu_modelo_basico'
require_relative '../../model/alumno'
require_relative 'HtmlView'

=begin
A view built programmatically.
=end

module AlumnoView
  def initialize(el_alumno)
    @alumno = el_alumno
  end
end

class AlumnoHtmlView
include HtmlView
include AlumnoView

  def view_html
    result = "<html><body>\n<h1>Alumno</h1>\n"
    result = result + "<table>\n"
    result = result +
        "<tr><td style='padding-right:20px;'>Legajo</td><td>
#{@alumno.legajo}</td></tr>\n"
    result = result + "<tr><td style='padding-right:20px;'>Nombre</td><td>
#{@alumno.nombre}</td></tr>\n"
    result = result + "<tr><td style='padding-right:20px;'>Cant. materias aprobadas</td><td>
#{@alumno.cantidad_materias_aprobadas}</td></tr>\n"
#		result = result + "<tr><td>Aprobo</td><td>#{@alumno.cantidadMateriasAprobadas.to_s + ' materias'}</td></tr>\n"
    result = result + "</table>\n"
    result = result + "</body></html>"
  end
end


class AlumnoConsoleView
include AlumnoView

  def console_show
    puts "Alumno"
    puts ""
    puts "Legajo: #{@alumno.legajo}"
    puts "Nombre: #{@alumno.nombre}"
    puts "Cant. materias aprobadas: #{@alumno.cantidad_materias_aprobadas}"
  end
end
