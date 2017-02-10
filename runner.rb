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

  def action_prompt(num)
    puts ""
    puts "You are in room #{num + 1}."
    puts ""
    puts "What would you like to do?"
    puts "1. Add a guest to the room"
    puts "2. Add a song to the playlist"
    puts "3. Add another room"
    puts "4. Go to another room"
    puts "5. List the people in this room"
    puts "6. Give me the playlist in this room"
    puts "7. Leave"
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
      @rooms[num].check_in(guest)
      puts ""
      if @rooms[num].guests.include?(guest)
        puts "#{guest_name} has been added to the room."
      else
        puts "I'm sorry, #{guest_name} couldn't be added to the room."
      end
        action_prompt(num)
    
    elsif action_input == 2
      puts "What's the title of the song?"
      song_title = gets.chomp
      song = Song.new(song_title)
      @rooms[num].add_song(song)
      puts ""
      puts "You're such a cliche..." if song_title.downcase == "don't stop believin'"
      puts "Your song has been added to the playlist."
      @rooms[num].guests.each do |singer,song_num| 
           puts "#{singer.name} says 'Woo! I love this song!" if @rooms[num].songs[song_num.to_i].title == (singer.song)
      end
      action_prompt(num)
    
    elsif action_input == 3
      room_prompt
      action_prompt(num + 1)
    
    elsif action_input == 4
      puts ""
      puts "Which room would you like to move to?"
      room_choice = gets.chomp.to_i - 1
      if @rooms[room_choice] == nil
        puts "I'm sorry, that room hasn't been created"
        action_prompt(num)
      else
        action_prompt(room_choice)
      end

    elsif action_input == 5
      puts ""
      puts "The people in room #{num + 1} are:"
      @rooms[num].guests.each {|singer| puts singer.name}
      action_prompt(num)

    elsif action_input == 6
      puts ""
      puts "The playlist in room #{num + 1} has the songs:"
      @rooms[num].songs.each {|tune| puts tune.title}
      action_prompt(num)

    elsif action_input == 7
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