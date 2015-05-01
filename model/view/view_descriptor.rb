require_relative '../view/HtmlView'
require_relative 'class_descriptor'

class DescriptorView
  def initialize(theModel, theDescriptor)
    @model = theModel
    @descriptor = theDescriptor
  end
end

class DescriptorHtmlView < DescriptorView
  include HtmlView

  def view_html
    result = "<html><body>\n<h1>#{@descriptor.label}</h1>\n"
    result = result + "<table>\n"
    @descriptor.properties.each { |prop|
      result = result + "<tr><td style='padding-right:20px;'>#{prop.label}</td><td>#{prop.value(@model)}</td></tr>\n"
    }
    result = result + "</table>\n"
    result = result + "</body></html>"
  end

end


class DescriptorConsoleView < DescriptorView

  def console_show
    puts @descriptor.label
    puts ""
    @descriptor.properties.each { |prop|
      puts "#{prop.label}: #{prop.value(@model)}"
    }
  end

end