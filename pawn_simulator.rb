class PawnSimulator

  def initialize
    @board = Array.new(8) {Array.new(8)}
  end

  def run
    @live = true

    while @live
      print '> '
      input = gets.chomp
      inputs = input.split(' ')
      command = inputs.shift
      arguments = inputs

      case command
        when 'PLACE'
          place(x: arguments[0], y: arguments[1], face: arguments[2], color: arguments[3])
        when 'MOVE'
          move(step: arguments[0])
        when 'RIGHT'
          change_direction(direction: "RIGHT")
        when 'LEFT'
          change_direction(direction: "LEFT")
        when 'REPORT'
          report
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
    return if @pawn.nil?

    if direction == 'RIGHT'
      @pawn[:face] = directions[@pawn[:face]]
    else
      @pawn[:face] = directions.key(@pawn[:face])
    end
  end

  def move(step: )
    return if @pawn.nil?
    movement(face: @pawn[:face], step: step)
  end

  def report
    print 'NO PAWN' if @pawn.nil?

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

  def movement(face:, step:)
    if face == 'NORTH'
      if @pawn[:location][0].to_i - step <= 0
        @pawn[:location][0] = @pawn[:location][0].to_i - step
      end
    elsif face == 'SOUTH'
      if @pawn[:location][0].to_i + step <= 7
        @pawn[:location][0] = @pawn[:location][0].to_i + step
      end
    elsif face == 'EAST'
      if @pawn[:location][1].to_i + step <= 7
        @pawn[:location][1] = @pawn[:location][1].to_i + step
      end
    elsif face == 'WEST'
      if @pawn[:location][1].to_i - step <= 0
        @pawn[:location][1] = @pawn[:location][1].to_i + step
      end
    end
  end

end

