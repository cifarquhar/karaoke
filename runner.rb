require_relative('room')
require_relative('guest')
require_relative('song')

class Runner

  def initialize()
    @rooms = []
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

  def action_prompt
    puts "What would you like to do?"
    puts "1. Add a guest to the room"
    puts "2. Add a song to the playlist"
    puts ""
    puts "Please enter a number:"
    action_input = gets.chomp.to_i
    if action_input == 1
      puts "What's the guest's name?"
      guest_name = gets.chomp
      puts "How much money do they have?"
      guest_money = gets.chomp.to_i
      guest = Guest.new(guest_name,guest_money)
      @rooms[0].check_in(guest)
      if @rooms[0].guests.include?(guest)
        puts "#{guest_name.capitalize} has been added to the room."
      else
        puts "I'm sorry, #{guest_name.capitalize} couldn't be added to the room."
      end
    elsif action_input == 2
      puts "What's the title of the song?"
      song_title = gets.chomp
      song = Song.new(song_title)
      @rooms[0].add_song(song)
      puts "Your song has been added to the playlist."
    else
      puts "I'm sorry, I can't do that."
      puts ""
      action_prompt
    end
  end





end

club = Runner.new
club.room_prompt
club.action_prompt