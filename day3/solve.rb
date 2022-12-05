require 'set'

file = File.open("input")
score = file.readlines.map(&:chomp).each_slice(3).reduce(0) do |score, (line_a, line_b, line_c)|
  elf_1, elf_2, elf_3 = [line_a, line_b, line_c].map { |line| Set.new(line.split("")) }
  score += (elf_1 & elf_2 & elf_3).reduce(0) do |score, shared_item|
    if shared_item.ord < 97
      shared_item.ord - 64 + 26
    else
      shared_item.ord - 96
    end
  end
end

puts score
