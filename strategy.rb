Dir['./lib/*.rb'].each { |lib| require lib }

@stuff = {
  :vertical_moves => 0,
  :horizontal_moves => 0,
  :shots_taken => 0,
  :vertical_limit => rand(4),
  :horizontal_limit => rand(4)
}

include DoStuff

on_turn do
  enemy = opponents.first
  if enemy
    if i.can_fire_at?(enemy)
      if my.ammo < 2
        '.'
      else
        if i.can_see?(enemy)
          if @stuff[:shots_taken] <= 3
            @stuff[:shots_taken] += 1
            #rotation_thing = my.rotation
            #direction_thing = my.direction_to(enemy)
            #degrees_of_skew = rotation_thing - direction_thing
            'f'
            #if degrees_of_skew == 0
            #  'f'
            #else
            #  fire!(degrees_of_skew)
            #end
          else
            @stuff[:shots_taken] = 0
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
    if my.ammo_full?
      move_around
    else
      '.'
    end
  end
end

def move_around
  if @stuff[:vertical_moves] >= @stuff[:vertical_limit]
    @stuff[:vertical_moves] = 0
    @stuff[:vertical_limit] = rand(4)
    if can_move? move!(EAST)
      go_east
    else
      go_west
    end
  elsif @stuff[:horizontal_moves] >= @stuff[:horizontal_limit]
    @stuff[:horizontal_moves] = 0
    @stuff[:horizontal_limit] = rand(4)
    if can_move? move!(NORTH)
      go_north
    else
      go_south
    end
  else
    if can_move? move!(NORTH)
      go_north
    else
      go_east
    end
  end
end

def go_east
  @stuff[:horizontal_moves] += 1
  move!(EAST)
end

def go_west
  @stuff[:horizontal_moves] += 1
  move!(WEST)
end

def go_north
  @stuff[:vertical_moves] += 1
  move!(NORTH)
end

def go_south
  @stuff[:vertical_moves] += 1
  move!(SOUTH)
end