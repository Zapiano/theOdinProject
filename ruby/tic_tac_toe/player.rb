class Player
  attr_reader :name
  attr_accessor :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
