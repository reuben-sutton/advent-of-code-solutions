file = File.open("input")
input = file.readlines.map(&:chomp)
elves = []
current_elf_count = 0
input.each do |line|
  if line == ""
    elves.append(current_elf_count)
    current_elf_count = 0
  else
    current_elf_count += line.to_i
  end
end

puts elves.sort.reverse.first(3).sum
