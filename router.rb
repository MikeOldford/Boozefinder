if ARGV.empty?
  puts "Usage: ruby router.rb [action]"
else
  action = ARGV[0]

  if action == "index"
    puts "Action: index"
  elsif action == "show"
    puts "Action: show"
  else
    puts "Unknown action #{action}. Use index or show."
  end
end