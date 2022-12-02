RESULT_SCORES = {
  'X' => 0,
  'Y' => 3,
  'Z' => 6,
}

ROCK = 1
PAPER = 2
SCISSORS = 3

GAME_TO_MOVE_SCORES = {
  ['A', 'X']  => SCISSORS,
  ['A', 'Y']  => ROCK,
  ['A', 'Z']  => PAPER,
  ['B', 'X']  => ROCK,
  ['B', 'Y']  => PAPER,
  ['B', 'Z']  => SCISSORS,
  ['C', 'X']  => PAPER,
  ['C', 'Y']  => SCISSORS,
  ['C', 'Z']  => ROCK,
}

file = File.open("input")
input = file.readlines.map{ |line| line.chomp && line.split(" ") }

total_score = input.reduce(0) do |score, (enemy_move, outcome)|
  score += RESULT_SCORES[outcome] + GAME_TO_MOVE_SCORES[[enemy_move, outcome]]
end

puts total_score
