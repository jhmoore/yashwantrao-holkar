Dir['./lib/*.rb'].each { |lib| require lib }

@times_moved_vertically = 0
@times_moved_horizontally = 0
@arbitrary_bullshit = 0

include DoStuff

on_turn do
  return rest if robot.ammo == 0

  if opponents.length >= 1
    opponent = opponents.first
    #if opponent.obscured?
    #  move_around
    #else
    #  'f'
    #end
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
    #fire_method
  else
    move_around
  end
end

def move_around
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