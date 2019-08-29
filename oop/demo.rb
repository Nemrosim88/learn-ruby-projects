class Demo
    @first_name
    @date

    # Setter
    def first_name=(name)
      @first_name = name
    end

    # Getter
    def first_name
      @first_name
    end
    

    def to_s
      # Переопределение метода (как в Java)
      "Name is: #{@first_name}"
    end
end

class SimplerDemo
  # Will generate getters and setters
  attr_accessor :first_name, :last_name
  # Will generate only GETTER
  attr_reader :last_name
    @first_name
    @last_name

    def to_s
      # Переопределение метода (как в Java)
      "Name is: #{@first_name}"
    end
end

demo = Demo.new
demo.first_name = "Bruce"
puts demo.first_name