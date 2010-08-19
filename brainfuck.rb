class Brainfuck
  def initialize()
    @memory = [0] * 5000
    @position = 0
    @b=[]
    @x = 0
  end

  def right()
    @position += 1 if !@run
  end

  def left()
    @position -= 1 if !@run
  end

  def inc
    @memory[@position] += 1 if !@run
  end

  def dec
    @memory[@position] -= 1 if !@run
  end

  def print
    puts(@memory[@position].chr) if !@run
  end

  def input
    @memory[@position] = $stdin.getc if !@run
  end

  def start_loop
    @x+=1

    if @memory[@position] == 0
      @run = true
    else
      @b[@x] = $i-1
    end
  end

  def end_loop
    if @run
      @run = false
    else
      $i=@b[@x]
    end

    @x-=1
  end

  def self.eval(string)
    @b = Brainfuck.new()
    $i = 0

    while $i < string.length()
      str = string[$i].chr

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
      
      $i += 1      
    end
  end
end