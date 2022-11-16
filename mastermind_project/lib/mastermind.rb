require_relative "code"
require "byebug"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        puts @secret_code.num_exact_matches(guess)
        puts @secret_code.num_near_matches(guess)
    end

    def ask_user_for_guess
        print "Enter a code: "
        guess = Code.from_string(gets.chomp)
        self.print_matches(guess)
        return @secret_code == guess
    end

end
