@times_moved_vertically = 0

on_turn do
  return rest unless robot.ammo > 1

  if opponents.length > 1
    opponent = opponents.first
    if can_fire_at?(opponent)
      if aiming_at?(opponent)
        fire_at!(opponent)
      else
        if opponent.obscured?
          move_around
        else
          aim_at!(opponent)
        end
      end
    else
      aim_at!(opponent)
    end
  else
    move_around
  end
end

def move_around
  if @times_moved_vertically >= 4

    @times_moved = 0
    if can_move? move!(EAST)
      move!(EAST)
    else
      move!(WEST)
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