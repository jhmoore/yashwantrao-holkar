on_turn do
  return rest unless robot.ammo > 1

  if opponents.length > 1
    opponent = opponents.first
    if opponent.obscured?
      rest
    end

    if can_fire_at?(opponent)
      if aiming_at?(opponent)
        fire_at!(opponent)
      else
        aim_at!(opponent)
      end
    else
      aim_at!(opponent)
    end
  else
    rest
  end
end