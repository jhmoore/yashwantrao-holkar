@times_moved_vertically = 0
@times_moved_horizontally = 0

on_turn do
  return rest unless robot.ammo > 1

  if opponents.length >= 1
    opponent = opponents.first
    if can_see?(opponent)
      if can_fire_at?(opponent)
        fire_at!(opponent)
      else
        aim_at!(opponent)
      end
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
      @times_moved_vertically = 0
      @times_moved_horizontally = 0
      first_possible_move('ensw')
    end
  end
end