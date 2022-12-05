def build_base_stack(stacks_input)
  stacks_input = stacks_input.split("\n").reverse
  stacks_input[1..-1].reduce(Hash.new) do |stacks, line|
    empty_stack_counter = 0
    stack_number = 0
    line.each_char.with_index do |char, index|
      if char == "["
        empty_stack_counter = 0
        stack_number += 1
      elsif char == "]"
        empty_stack_counter = 0
      elsif char == " " && empty_stack_counter > 0
        stack_number += 1 if empty_stack_counter == 3
        empty_stack_counter = empty_stack_counter - 1
      elsif char == " " # separator
        empty_stack_counter = 3
      else
        stacks[stack_number.to_s] ||= []
        stacks[stack_number.to_s] << char
      end
    end
    stacks
  end
end

def build_moves(moves_input)
  moves_input.split("\n").map do |move|
    match_data = move.match(/move (\d+) from (\d+) to (\d+)/)
    [match_data[1].to_i, match_data[2], match_data[3]]
  end
end

def process_moves(stacks, moves)
  moves.each.with_index do |move, index|
    count, from, to = move
    stacks[to] = stacks[to] + stacks[from].pop(count)
  end
  stacks
end

file = File.open("input")
stacks_input, moves_input = file.read.split("\n\n")
stacks = build_base_stack(stacks_input)
moves = build_moves(moves_input)
process_moves(stacks, moves).each_pair do |key, value|
  puts "#{key}: #{value.last}"
end
