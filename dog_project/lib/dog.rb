class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name 
        @name
    end
    
    def breed 
        @breed
    end

    def age
        @age
    end

    def age=(num)
        @age = num
    end
    def bark
        if @age > 3
            return @bark.upcase
        elsif @age <= 3
            return @bark.downcase
        end
    end
    
    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(string)
        faves = @favorite_foods.map {|food| food.downcase}
        return faves.include?(string.downcase)
    end


end
