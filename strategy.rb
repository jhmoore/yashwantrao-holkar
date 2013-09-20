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
    first_possible_move('ensw')
  end
end