require "yaml"

def load_library(filepath)
  emoji = YAML.load_file(filepath)
  emoji_new = {}
  emoji.each do |key, types|
    types.map do |emoticons|
      emoji_new[key] = {}
      emoji_new[key][:english] = types[0]
      emoji_new[key][:japanese] = types[1]
    end
  end
  return emoji_new
end

def get_japanese_emoticon
end


def get_english_meaning(file, jap_emoji)
  library = load_library(file)
  x = ""
  apology = "Sorry, that emoticon was not found"
  library.find do |meanings, emojis|
    if library[meanings][:japanese] == jap_emoji
      x = meanings
    end
  end
  if x = ""
    puts apology
  end
  return x
end