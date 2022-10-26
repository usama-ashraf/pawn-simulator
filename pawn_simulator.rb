class PawnSimulator

  def initialize
    @board = Array.new(8) {Array.new(8)}
  end

  def run
    @live = true

    while @live
      print '> '
      input = gets.chomp
      inputs = input.gsub(' ', ',').split(',')
      command = inputs.shift
      arguments = inputs

      case command
        when 'PLACE'
          @first_move, @invalid_move = false
          place(x: arguments[0].to_i, y: arguments[1].to_i, face: arguments[2], color: arguments[3])
        when 'MOVE'
          is_valid_move?(arguments[0])
          move(step: arguments[0] ? arguments[0].to_i : 1) if !@invalid_move
        when 'RIGHT'
          change_direction(direction: "RIGHT")
        when 'LEFT'
          change_direction(direction: "LEFT")
        when 'REPORT'
          report
        when 'EXIT'
          exit
      end
    end
  end

  def place(x:, y:, face:, color:)
    @pawn = {
      location: [x,y],
      face: face,
      color: color
    }
  end

  def change_direction(direction:)
    if @pawn.nil?
      puts 'First command should be of PLACE'
      return
    end

    if direction == 'RIGHT'
      @pawn[:face] = directions[@pawn[:face].to_sym]
    else
      @pawn[:face] = directions.key(@pawn[:face]).to_s
    end
  end

  def move(step: )
    if @pawn.nil?
      puts 'First command should be of PLACE'
      return
    end

    movement(face: @pawn[:face], step: step)
    @first_move = true
  end

  def report
    if @pawn.nil?
      puts 'First command should be of PLACE'
      return
    end

    puts "#{@pawn[:location][0]}, #{@pawn[:location][1]}, #{@pawn[:face]}, #{@pawn[:color]}"
  end

  def exit
    puts 'Thank you for playing pawn player!'
    @live = false
  end

  def directions
    {
      "NORTH": "EAST",
      "EAST": "SOUTH",
      "SOUTH": "WEST",
      "WEST": "NORTH",
    }
  end

  def is_valid_move?(move)
    @invalid_move = false
    if move.to_i >= 2 && @first_move
      puts 'Invalid move!!! Move cannot be greater than 1 now.'
      @invalid_move = true
      return

    elsif move.to_i >=3
      puts 'Invalid move!!! Move cannot be greater than 2.'
      @invalid_move = true
      return
    end
  end

  def north(location, step)
    if location + step < 0 || location + step >= 8
      puts 'This move will make pawn fall of the board'
      return
    end
    @pawn[:location][1] = location + step
  end

  def south(location, step)
    if location - step < 0 || location - step >= 8
      puts 'This move will make pawn fall of the board'
      return
    end
      @pawn[:location][1] = location - step
  end

  def east(location, step)
    if location + step < 0 || location + step >= 8
      puts 'This move will make pawn fall of the board'
      return
    end
    @pawn[:location][0] = location + step
  end

  def west(location, step)
    if location - step < 0 || location - step >= 8
      puts 'This move will make pawn fall of the board'
      return
    end
    @pawn[:location][0] = location - step
  end

  def movement(face:, step:)
    if face == 'NORTH'
      north(@pawn[:location][1], step)
    elsif face == 'SOUTH'
      south(@pawn[:location][1], step)
    elsif face == 'EAST'
      east(@pawn[:location][0], step)
    elsif face == 'WEST'
      west(@pawn[:location][0],step)
    end
  end
end

