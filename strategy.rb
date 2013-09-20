Dir['./lib/*.rb'].each { |lib| require lib }

@times_moved_vertically = 0
@times_moved_horizontally = 0
@arbitrary_bullshit = 0

include DoStuff

on_turn do
  #return '.' if my.ammo < 1
  #
  #if opponents.length > 0
  #  enemy = opponents.first
  #  move_around unless enemy
  #  return move_towards! enemy if obscured? enemy
  #  return 'f' if can_fire_at? enemy
  #  return aim_at! enemy unless aiming_at? enemy
  #  move_towards! enemy
  #else
  #  move_around
  #end

  enemy = opponents.first
  if enemy
    if !aiming_at(enemy)
      @arbitrary_bullshit += 20
      "r#{@arbitrary_bullshit.to_s}"
    else
      move_around
    end
  else
    'f'
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