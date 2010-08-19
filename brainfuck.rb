class Brainfuck
  def initialize()
    @memory = [0] * 5000
    @position = 0
    @loop_array = []
    @loop_position = 0
    @test = []
  end

  def right()
    @position += 1 if !@not_run
  end

  def left()
    @position -= 1 if !@not_run
  end

  def inc
    @memory[@position] += 1 if !@not_run
  end

  def dec
    @memory[@position] -= 1 if !@not_run
  end

  def print
    @test << @memory[@position].chr
    puts(@memory[@position].chr) if !@not_run
  end

  def input
    @memory[@position] = $stdin.getc if !@not_run
  end

  def start_loop
    @loop_position += 1

    if @memory[@position] == 0
      @not_run = true
    else
      @loop_array[@loop_position] = $intr_position - 1
    end
  end

  def end_loop
    if @not_run
      @not_run = false
    else
      $intr_position = @loop_array[@loop_position]
    end

    @loop_position -= 1
  end

  def self.eval(string)
    @b = Brainfuck.new()
    $intr_position = 0

    while $intr_position < string.length()
      str = string[$intr_position].chr

      case str
      when '<' then @b.right()
      when '>' then @b.left()
      when '+' then @b.inc()
      when '-' then @b.dec()
      when '.' then @b.print()
      when ',' then @b.input()
      when '[' then @b.start_loop()
      when ']' then @b.end_loop()
      else raise "Invalid character! #{str}"
      end
      
      $intr_position += 1      
    end
    
    return @b
  end
end