require_relative('room')
require_relative('guest')
require_relative('song')
require('pry')

class Runner

  def initialize()
    @rooms = []
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

  def action_prompt
    puts ""
    puts "What would you like to do?"
    puts "1. Add a guest to the room"
    puts "2. Add a song to the playlist"
    puts "3. Leave"
    puts ""
    puts "Please enter a number:"
    action_input = gets.chomp.to_i
    if action_input == 1
      puts "What's the guest's name?"
      guest_name = gets.chomp.capitalize
      puts "How much money do they have?"
      guest_money = gets.chomp.to_i
      puts "What's their favourite song?"
      guest_song = gets.chomp
      guest = Guest.new(guest_name,guest_money,guest_song)
      @rooms[0].check_in(guest)
      puts ""
      if @rooms[0].guests.include?(guest)
        puts "#{guest_name} has been added to the room."
      else
        puts "I'm sorry, #{guest_name} couldn't be added to the room."
      end
        action_prompt
    elsif action_input == 2
      puts "What's the title of the song?"
      song_title = gets.chomp
      song = Song.new(song_title)
      @rooms[0].add_song(song)
      puts ""
      puts "You're such a cliche..." if song_title.downcase == "don't stop believin'"
      puts "Your song has been added to the playlist."
      @rooms[0].guests.each do |singer,song_num| 
           puts "#{singer.name} says 'Woo! I love this song!" if @rooms[0].songs[song_num.to_i].title == (singer.song)
      end
      action_prompt
    elsif action_input == 3
      leave_action
    else
      puts "I'm sorry, I can't do that."
      puts ""
      action_prompt
    end
  end


  def run
    room_prompt
    action_prompt
  end



end


club = Runner.new
club.run