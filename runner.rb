require_relative('room')
require_relative('guest')
require_relative('song')
require_relative('bar')
require('pry')

class Runner

  def initialize()
    @rooms = []
    @bar = Bar.new
    @happy_guests = []
  end

  def leave_action
    puts "Thanks for visiting!"
  end

  def room_prompt
    puts "How big would you like the room to be (small/medium/large)?"
    input1 = gets.chomp
    size = input1
    puts "How much do you want to charge for entry?"
    input2 = gets.chomp.to_i
    entry_fee = input2
    @rooms << Room.new(size,entry_fee)
    puts "#{input1.capitalize} room created, entry will cost #{entry_fee}."
    puts ""
  end

  def guest_add_prompt(room)
    puts "What's the guest's name?"
    guest_name = gets.chomp.capitalize
    puts "How much money do they have?"
    guest_money = gets.chomp.to_i
    puts "What's their favourite song?"
    guest_song = gets.chomp
    guest = Guest.new(guest_name,guest_money,guest_song)
    room.check_in(guest)
    puts ""
    if room.guests.include?(guest)
      puts "#{guest_name} has been added to the room."
      room.add_to_tab(guest,room.entry_fee)
      puts "#{guest_name}'s tab is now #{guest.tab}"
    else
      puts "I'm sorry, #{guest_name} couldn't be added to the room."
    end
  end

  def song_add_prompt(room)
    puts "What's the title of the song?"
    song_title = gets.chomp
    song = Song.new(song_title)
    room.add_song(song)
    puts ""
    puts "Your song has been added to the playlist."
  end

  def drink_add_prompt(room)
    puts "Which guest?"
    guest_id = gets.chomp.capitalize
    guest_index = room.guests.find_index(room.guests.find {|person| person.name == guest_id})
    puts "Which drink (beer/wine/cider/vodka)?"
    guest_drink = gets.chomp
    room.add_to_tab(room.guests[guest_index],@bar.drinks[guest_drink])
    puts "#{guest_drink.capitalize} added to #{guest_id.capitalize}'s tab. #{guest_id.capitalize}'s tab is now #{room.guests[guest_index].tab}."
  end

  def action_prompt(num)
    this_room = @rooms[num]
    puts ""
    puts "You are in room #{num + 1}."
    puts ""
    puts "What would you like to do?"
    puts "1. Add a guest to the room"
    puts "2. Add a song to the playlist"
    puts "3. Buy a drink for a guest"
    puts "4. Add another room"
    puts "5. Go to another room"
    puts "6. List the people in this room"
    puts "7. Give me the playlist in this room"
    puts "8. List the guests' tabs"
    puts "9. Leave"
    puts ""
    puts "Please enter a number:"
    action_input = gets.chomp.to_i
   
    if action_input == 1
      guest_add_prompt(this_room)
      action_prompt(num)
    
    elsif action_input == 2
     song_add_prompt(this_room)
      # @rooms[num].guests.each do |singer| 
      #    @rooms[num].songs.each do |song|
      #       puts "#{singer.name} says 'Woo! I love this song!" if song.title == (singer.song) && @happy_guests.include?(singer) ==false
      #       @happy_guests << singer
      #       binding.pry
      #     end
      # end
      action_prompt(num)

    elsif action_input == 3
      drink_add_prompt(this_room)
      action_prompt(num)
    
    elsif action_input == 4
      room_prompt
      action_prompt(num + 1)
    
    elsif action_input == 5
      puts ""
      puts "Which room would you like to move to?"
      room_choice = gets.chomp.to_i - 1
      if @rooms[room_choice] == nil
        puts "I'm sorry, that room hasn't been created"
        action_prompt(num)
      else
        action_prompt(room_choice)
      end

    elsif action_input == 6
      puts ""
      puts "The people in room #{num + 1} are:"
      @rooms[num].guests.each {|singer| puts singer.name}
      action_prompt(num)

    elsif action_input == 7
      puts ""
      puts "The playlist in room #{num + 1} has the songs:"
      @rooms[num].songs.each {|tune| puts tune.title}
      action_prompt(num)

    elsif action_input == 8
      puts ""
      @rooms[num].guests.each do |visitor|
        puts "#{visitor.name}'s tab is #{visitor.tab}."
      end
      action_prompt(num)

    elsif action_input == 9
      leave_action

    else
      puts "I'm sorry, I can't do that."
      puts ""
      action_prompt(num)
    end
  end


  def run
    room_prompt
    action_prompt(0)
  end



end


club = Runner.new
club.run