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
      puts "  <h2>#{product['name']}</h2>"
      puts "  <img src='#{product['image_thumb_url']}'  class='product-thumbnail'/>"
      puts "  <ul class='product-data'>"
      puts "    <li>id: #{product['id']}</li>"
      puts "    <li>#{product['producer_name']}</li>"
      puts "    <li>#{product['primary_category']}</li>"
      puts "    <li>#{product['secondary_category']}</li>"
      puts "    <li>#{product['volume_in_milliliters']} ml</li>"
      puts "    <li>$#{format_price(product['price_in_cents'])}</li>"
      puts "  </ul>"
      puts "</div>"
    end
    
    puts "<footer>"
    puts "  For more info see the <a href='http://lcboapi.com/docs/products'>products API docs</a>."
    puts "</footer>"

    print_footer
  end

  def show(product_id)
    print_header
    puts "HtmlGenerator: show; id: #{product_id}"
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

  # Convert a string of a price in cents to a float.
  # e.g. "199" to 1.99
  def format_price(cents_string)
    cents_string.to_f/100
  end

end