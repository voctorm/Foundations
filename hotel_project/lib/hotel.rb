require_relative "room"

class Hotel

    def initialize(name, hash)
        @name = name
        @rooms_temp = hash
        
        rooms = Hash.new()
        @rooms_temp.each do |key, value|
            rooms[key] = Room.new(value)
        end

        @rooms = rooms
    end

    #p cash("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)

    def name
        names = @name.split(" ").map {|word| word.capitalize}
        names.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            print "sorry, room does not exist"
        else
            if !@rooms[room_name].full?
                @rooms[room_name].add_occupant(person)
                print "check in successfull"
            else
                print "sorry, room is full"
            end
        end
    end

    def has_vacancy?
       @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each do |name, number|
            puts name + " #{number.available_space}"
        end
    end
end

# hotel = Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)
# hotel.check_in("Harry", "Under the Stairs")
# p hotel.has_vacancy?