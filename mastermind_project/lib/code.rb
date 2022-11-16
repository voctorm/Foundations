class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  # PART 1

  attr_reader :pegs

  def self.valid_pegs?(array)
    array.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(array)
    if !Code.valid_pegs?(array)
      raise "Not valid colours"
    else
      @pegs = array.map { |peg| peg.upcase }
    end
  end

  def self.random(length)
    pegs = []
    length.times do 
      pegs << POSSIBLE_PEGS.keys.sample
    end
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.upcase.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  # PART 2

  def num_exact_matches(guess)
    num = 0
    (0...guess.length).each do |ind|
      if guess[ind] == @pegs[ind]
        num += 1
      end
    end
    num
  end

  def num_near_matches(guess)
    num = 0
    guess_temp = guess.pegs.map { |peg| peg }
    pegs_temp = @pegs.map { |peg| peg}

    ind=0
    while ind < guess_temp.length
      if guess_temp[ind] == pegs_temp[ind]
        guess_temp.delete_at(ind)
        pegs_temp.delete_at(ind)
        ind = 50
      end
      if ind == 50
        ind =0
      else
        ind+=1
      end
    end

    (0...guess_temp.length).each do |ind|
      times = pegs_temp.count(guess_temp[ind]) - guess_temp[0...ind].count(guess_temp[ind])
      if times > 0
        num +=1
      end
    end
    return num
  end


  def ==(guess)
    if self.pegs == guess.pegs
      return true
    else
      return false
    end
  end
  
end
