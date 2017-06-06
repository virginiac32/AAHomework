require "byebug"

class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = [[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[],[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[:stone, :stone, :stone, :stone],
      [:stone, :stone, :stone, :stone],[]]
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    valid_pos = [1,2,3,4,5,7,8,9,10,11,12]
    unless valid_pos.include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    # positions = {1=>0,2=>1,3=>2,4=>3,5=>4,6=>5,:store1=>6,7=>7,8=>8,
    #   9=>9,10=>10,11=>11,12=>12,:store2=>13}
    # debugger
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    if current_player_name == name1
      positions = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    else
      positions = [0,1,2,3,4,5,7,8,9,10,11,12,13]
    end
    idx = positions.index(start_pos)+1
    idx = 0 if idx >= positions.length
    until num_stones == 0
      pos = positions[idx]
      @cups[pos].push(:stone)
      idx+=1
      idx = 0 if idx == positions.length
      num_stones -=1
    end
    render
    if idx == 0
      idx = 12
    else
      idx -= 1
    end
    next_turn(idx,current_player_name)
  end

  def next_turn(ending_cup_idx,current_player_name)
    # helper method to determine what #make_move returns
    return :switch if @cups[ending_cup_idx].length == 1 &&
      ![6,13].include?(ending_cup_idx)
    if current_player_name == name1 && ending_cup_idx == 6
      return :prompt
    elsif current_player_name == name2 && ending_cup_idx == 12
      return :prompt
    end
    unless @cups[ending_cup_idx].length == 1
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all?{|arr| arr.length == 0} ||
    @cups[7..12].all?{|arr| arr.length == 0}

  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length
      return name1
    else
      return name2
    end
  end
end
