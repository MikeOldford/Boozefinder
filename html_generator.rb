require 'json'
require 'open-uri'

class HtmlGenerator
  def index
    # Retrieve the list of products
    products = retrieve_data("http://lcboapi.com/products")

    print_header

    puts "<h1>All products</h1>"

    # Loop over the products, printing each one
    products.each do |product|
      puts "<div class='product'>"
      puts product["name"]
      puts "</div>"
    end
    
    puts "<footer>"
    puts "  For more info see the <a href='http://lcboapi.com/docs/products'>products API docs</a>."
    puts "</footer>"

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
    puts "    <link rel='stylesheet' href='normalize.css' type='text/css'>"
    puts "    <link rel='stylesheet' href='styles.css' type='text/css'>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def retrieve_data(url)
    # Retrieve JSON-formatted text from lcboapi.com
    raw_response = open(url).read

    # Parse JSON-formatted text into a Ruby Hash
    parsed_response = JSON.parse(raw_response)

    # Return just the actual result data from the response, ignoring metadata
    result = parsed_response["result"]
  end

end