class Player
    def get_move
        print "enter a position with coordinates separated with a space like `4 7` "
        input = gets.chomp
        arr = input.split(" ")
        move = []
        arr.each do |num|
            move << num.to_i
        end
        return move
    end
end
