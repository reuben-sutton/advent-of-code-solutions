require 'set'

file = File.open("input")

# part1
def ranges_subset?(range_a, range_b)
  range_a.max >= range_b.max && range_a.min <= range_b.min ||
    range_b.max >= range_a.max && range_b.min <= range_a.min
end

# part2
def ranges_intersect?(range_a, range_b)
  (range_a.to_set & range_b.to_set).size > 0
end

count = file.readlines.map(&:chomp).reduce(0) do |count, line|
  elf_a, elf_b = line.split(",").map do |elf|
    from_section, to_section = elf.split("-").map(&:to_i)
    from_section.upto(to_section)
  end
  if ranges_intersect?(elf_a, elf_b)
    count + 1
  else
    count
  end
end

puts count
