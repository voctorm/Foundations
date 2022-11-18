class Board

    # PART 1
    attr_reader :size

    def initialize(n)
        @grid = []
        n.times do
            row = []
            n.times do
                row << :N
            end
            @grid << row
        end
        @n = n
        @size = n*n
    end

    def []((n,m))
        @grid[n][m]
    end

    def []=((n,m), value)
        @grid[n][m] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            count += row.count(:S)
        end
        count
    end

    # PART 2

    def attack(position)
        if self[position] == :S
            print "you sunk my battleship!"
            self[position] = :H
            return true
        else
            self[position] = :X 
            return false
        end
    end

    def place_random_ships
        while self.num_ships != @size/4 do
            self[[rand(0...@n), rand(0...@n)]] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        @grid.each do |row|
            new_row = row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        hidden_grid << new_row
        end
        hidden_grid
    end

    def self.print_grid(array)
        array.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def printt
        Board.print_grid(self.hidden_ships_grid)
    end

end
