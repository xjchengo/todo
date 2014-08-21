#!/usr/bin/env ruby

# This is a script provided to the users for painless migrate to new keywords.
# To be extra careful, we explicitly replace each exact keyword.

keywords = [
  /\bParse\b/
]

targets = [
  'AV']

kw_map = Hash[keywords.zip(targets)]

Dir.glob('*.js') do |java_file|
  puts "Processing #{java_file}..."
  text = File.read(java_file)
  kw_map.each do |from, to|
    text = text.gsub(from, to)
  end
  File.write(java_file, text)
end
