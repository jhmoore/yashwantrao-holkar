Dir['./lib/*.rb'].each { |lib| require lib }

@stuff_happened = {
  :vertical_moves => 0,
  :horizontal_moves => 0,
  :shots_taken => 0
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
          if @stuff_happened[:shots_taken] <= 3
            @stuff_happened[:shots_taken] += 1
            rotation_thing = my.rotation.to_i
            direction_thing = my.direction_to(enemy).to_i

            if direction_thing && direction_thing != 0
              degrees_of_skew = rotation_thing - direction_thing
            else
              degrees_of_skew = 0
            end

            if degrees_of_skew == 0
              'f'
            else
              fire!(degrees_of_skew)
            end
          else
            @stuff_happened[:shots_taken] = 0
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
  if @stuff_happened[:vertical_moves] >= 3
    @stuff_happened[:vertical_moves] = 0
    if can_move? move!(EAST)
      go_east
    else
      go_west
    end
  elsif @stuff_happened[:horizontal_moves] >= 4
    @stuff_happened[:horizontal_moves] = 0
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
  @stuff_happened[:horizontal_moves] += 1
  move!(EAST)
end

def go_west
  @stuff_happened[:horizontal_moves] += 1
  move!(WEST)
end

def go_north
  @stuff_happened[:vertical_moves] += 1
  move!(NORTH)
end

def go_south
  @stuff_happened[:vertical_moves] += 1
  move!(SOUTH)
end