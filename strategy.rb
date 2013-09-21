Dir['./lib/*.rb'].each { |lib| require lib }

@times_moved_vertically = 0
@times_moved_horizontally = 0
@times_fired = 0

include DoStuff

on_turn do
  enemy = opponents.first
  if enemy
    if i.can_fire_at?(enemy)
      if my.ammo < 2
        '.'
      else
        if i.can_see?(enemy)
          if @times_fired <= 3
            @times_fired += 1
            'f'
          else
            @times_fired = 0
            move_around
          end
        else
          move_around
        end
      end
    else
      aim_at!(enemy)
    end
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