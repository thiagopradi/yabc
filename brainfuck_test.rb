require 'test/unit'
require 'brainfuck'

class TestBrainfuck < Test::Unit::TestCase
  def test_works
    @brainfuck = Brainfuck.eval(">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.>>>++++++++[<++++>-]<.>>>++++++++++[<+++++++++>-]<---.<<<<.+++.------.--------.>>+.")
    memory = @brainfuck.instance_variable_get(:@test)
    assert_equal(["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d", "!"], memory)
  end
end