require "http"
system "clear"
while true
  puts "Welcome to the Dictionary App"
  puts "Type a word: (type 'q' to stop)"
  input_word = gets.chomp

  if input_word == "q"
    break
  else
    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&in")

    word_data = response.parse(:json)

    word = word_data[0]["word"]
    definition = word_data[1]["text"]

    puts "#{input_word}: #{definition}"
    puts " "
  end
end

puts "thank you come again"
