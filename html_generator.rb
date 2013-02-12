class HtmlGenerator
  def index
    print_header
    puts "HtmlGenerator: index"
    print_footer
  end

  def show
    print_header
    puts "HtmlGenerator: show"
    print_footer
  end

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end
end