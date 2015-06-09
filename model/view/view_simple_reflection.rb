require_relative 'HtmlView'

=begin
A view based on reflection, it is configured by a list of nullary selectors.
=end

class SimpleReflectionView
  def initialize(the_model, the_fields)
    @model = the_model
    @fields = the_fields
  end

  def main_label
    @model.class.to_s
  end

  def label(field) # p.ej. :legajo
    field.to_s.capitalize
  end

  def value(field)
    @model.send(field).to_s
  end
end


class SimpleReflectionHtmlView < SimpleReflectionView
  include HtmlView

  def view_html
    result = "<html><body>\n<h1>#{main_label}</h1>\n"
    result = result + "<table>\n"
    @fields.each { |field|
      result = result + "<tr><td style='padding-right:20px;'>
#{self.label(field)}</td><td>
#{self.value(field)}</td></tr>\n"
    }
    result = result + "</table>\n"
    result = result + "</body></html>"
  end

end






class SimpleReflectionConsoleView < SimpleReflectionView

  def console_show
    puts main_label
    puts ""
    @fields.each { |field|
      puts "#{label(field)}: #{value(field)}"
    }
    puts ""
  end

end
