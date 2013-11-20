class TowersOfHanoi
  def initialize
    @towers = [[3,2,1],[],[]]
    @move_counter = 0
    greeting
  end

  def greeting
    puts "Welcome to Hanoi!"
    turn
  end

  def turn
    until win?
      display

      puts "Select the tower to move disks from: [0, 1, 2]"
      from = gets.chomp.to_i

      puts "Select the tower to move disks to: [0, 1, 2]"
      to = gets.chomp.to_i

      move(from,to)

    end
  end

  def display
    p @towers
  end

  def win?
    if @towers == [[],[],[3,2,1]]
      puts "You solved the towers in #{@move_counter} moves!"
      true
    end
  end

  def move(from, to)

    if from < 0 || from > 3 || to < 0 || to > 3
      puts "Invalid move.  Must select a tower within the correct range."
      return false
    elsif @towers[from].last.nil?
      puts "Invalid move.  Must select a tower that contains an element."
      return false
    elsif !@towers[to].last.nil? && @towers[from].last > @towers[to].last
      puts "Invalid move.  Can't put a bigger disk on a smaller disk."
      return false
    elsif from == to
      puts "Invalid move. Must move from one tower to another."
      return false
    end

    @towers[to] << @towers[from].pop
    @move_counter += 1
    return true
  end


end