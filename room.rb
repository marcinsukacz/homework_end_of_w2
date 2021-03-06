class Room

attr_reader :number, :num_of_places, :income
#attr_accessor :guests

def initialize(number, num_of_places)
  @number = number
  @guests = []
  @songs = []
  @num_of_places = num_of_places
  @income = 0

end

def count_guests
  return @guests.size()
end

def check_in_guest(guest)
  if places_left?() > 0
   @guests.push(guest)
   guest.money -= 10
   @income += 10
 else
   return "No more places"
 end
end

def check_out_guest(guest)
  @guests.delete(guest)
end

def guest_inside?(guest)
  return @guests.include?(guest)
end

def count_songs
  return @songs.count()
end

def add_song(title)
  @songs.push(title)
end

def places_left?
  return @num_of_places - @guests.size()
end

def song_in?(song)
  if @songs.include?(song)
    return true
  end
end



end


# You have been approached to build software for a Karaoke bar. Specifically, they want you to build a software for checking guests in and out, plus handling songs.
#
# Your program should be test driven and should be able to:
#
# Create rooms, songs and guests
# Check in guests to rooms/Check out guests from rooms
# Add songs to rooms
# Extensions
# What happens if there are more guests trying to be checked in than there is free space in the room?
# Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.
# Advanced extensions
# Guests could have a favourite song, and if their favourite song is on the room's playlist, they can cheer loudly! (return a string like "Whoo!")
# Rooms can keep track of the entry fees/spending of the guests - maybe add a bar tab/bar class?
# Add anything extra you think would be good to have at a karaoke venue!
