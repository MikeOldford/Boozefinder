require 'json'
require 'open-uri'

class HtmlGenerator
  def index
    # Retrieve the list of products
    products = retrieve_data("http://lcboapi.com/products")

    print_header

    # Loop over the products, printing each one
    products.each do |product|
      puts product["name"]
      puts "<br/>"
    end
    
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

  def retrieve_data(url)
    # Retrieve JSON-formatted text from lcboapi.com
    raw_response = open(url).read

    # Parse JSON-formatted text into a Ruby Hash
    parsed_response = JSON.parse(raw_response)

    # Return just the actual result data from the response, ignoring metadata
    result = parsed_response["result"]
  end

end