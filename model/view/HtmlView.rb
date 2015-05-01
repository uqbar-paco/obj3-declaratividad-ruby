module HtmlView
  def write_html(filename)
    IO.write(filename, self.view_html)
  end
end
