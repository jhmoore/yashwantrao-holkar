Dir['./lib/*.rb'].each { |lib| require lib }

@times_moved_vertically = 0
@times_moved_horizontally = 0
@arbitrary_bullshit = 0

include DoStuff

on_turn do
  return rest unless robot.ammo > 0

  if opponents.length >= 1
    opponent = opponents.first
    #return move_towards! opponent if obscured? opponent
    #return aim_at! opponent unless aiming_at? opponent
    #unless aiming_at?(opponent)
    #  @arbitrary_bullshit += 45
    #  if @arbitrary_bullshit > 360
    #    @arbitrary_bullshit = 0
    #  end
    #  return "r#{@arbitrary_bullshit.to_s}"
    #end
    'f'
  else
    move_around
  end
end