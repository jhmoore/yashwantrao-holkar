@times_moved_vertically = 0
@times_moved_horizontally = 0

on_turn do
  return rest unless robot.ammo > 1

  if opponents.length >= 1
    opponent = opponents.first
    if can_see?(opponent)
      'f'
    else
      first_possible_move('ensw')
    end
  else
    if @times_moved_vertically >= 4
      @times_moved_vertically = 0
      if can_move? move!(EAST)
        @times_moved_horizontally += 1
        move!(EAST)
      else
        @times_moved_horizontally += 1
        move!(WEST)
      end
    elsif @times_moved_horizontally >= 4
      @times_moved_horizontally = 0
      if can_move? move!(NORTH)
        @times_moved_vertically += 1
        move!(NORTH)
      else
        @times_moved_vertically += 1
        move!(SOUTH)
      end
    else
      if can_move? move!(NORTH)
        @times_moved_vertically += 1
        move!(NORTH)
      else
        @times_moved_vertically += 1
        move!(SOUTH)
      end
    end
  end
end