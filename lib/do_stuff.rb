module DoStuff
  def move_around
    first_possible_move('nswe')
    #if @times_moved_vertically >= 3
    #  @times_moved_vertically = 0
    #  if can_move? move!(EAST)
    #    @times_moved_horizontally += 1
    #    move!(EAST)
    #  else
    #    @times_moved_horizontally += 1
    #    move!(WEST)
    #  end
    #elsif @times_moved_horizontally >= 3
    #  @times_moved_horizontally = 0
    #  if can_move? move!(NORTH)
    #    @times_moved_vertically += 1
    #    move!(NORTH)
    #  else
    #    @times_moved_vertically += 1
    #    move!(SOUTH)
    #  end
    #else
    #  if can_move? move!(NORTH)
    #    @times_moved_vertically += 1
    #    move!(NORTH)
    #  else
    #    @times_moved_vertically += 1
    #    move!(SOUTH)
    #  end
    #end
  end
end