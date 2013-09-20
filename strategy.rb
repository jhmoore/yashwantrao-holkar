@times_moved_vertically = 0
@times_moved_horizontally = 0

on_turn do
  return rest unless robot.ammo > 0

  if opponents.length >= 1
    opponent = opponents.first
    if aimed_at?(opponent)
      'f'
    else
      aim_at!(opponent)
    end
  else
    if @times_moved_vertically >= 3
      @times_moved_vertically = 0
      if can_move? move!(EAST)
        @times_moved_horizontally += 1
        move!(EAST)
      else
        @times_moved_horizontally += 1
        move!(WEST)
      end
    elsif @times_moved_horizontally >= 3
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