require "employee"

class Startup

    # PART 2
    attr_reader :name, :funding, :salaries, :employees
    attr_writer :funding, :employees, :salaries

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries

        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if !salaries.keys.include?(title)
            raise "Title does not exist"
        else
            @employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if self.salaries[employee.title] < self.funding
            employee.pay(self.salaries[employee.title])
            self.funding -= self.salaries[employee.title]
        else
            raise "Not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end
        
    # PART 3

    def average_salary
        total_salaries = 0
        @employees.each do |employee|
            total_salaries += @salaries[employee.title]
        end

        total_salaries / @employees.length
    end

    def close
        self.employees = []
        self.funding = 0
    end

    def acquire(startup)
        self.funding += startup.funding

        startup.salaries.each do |title, salary|
            if !self.salaries.keys.include?(title)
                self.salaries[title] = salary
            end
        end

        startup.employees.each { |employee| self.employees << employee }

        startup.close
    end
end
