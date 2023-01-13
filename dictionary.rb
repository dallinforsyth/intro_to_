require "http"
system "clear"
while true
  puts "Welcome to the Dictionary App"
  puts "Type a word: (type 'q' to stop)"
  input_word = gets.chomp

  if input_word == "q"
    break
  else
    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

    # response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/audio?useCanonical=false&limit=50&api_key=")

    word_data = response.parse(:json)
    # audio_data = response2o.parse(:json)

    word = word_data[0]["word"]
    definition = word_data[1]["text"]

    puts "#{input_word}: #{definition}"
    # import webbrowser
    # webbrowser.open_new(audio_data[0]["fileUrl"])
    puts " "
  end
end

puts "thank you come again"
