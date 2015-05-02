require_relative 'HtmlView'

class SimpleReflectionView
  def initialize(the_model, the_fields)
    @model = the_model
    @fields = the_fields
  end

  def main_label
    @model.class.to_s.capitalize
  end

  def label(field)
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
      result = result + "<tr><td style='padding-right:20px;'>#{label(field)}</td><td>#{value(field)}</td></tr>\n"
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
