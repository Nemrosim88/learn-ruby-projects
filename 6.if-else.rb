# Branching 1
 if true
    puts "In TRUE block"
 else
    puts "In ELSE block"
 end


 # Branching 2
 condition = true
 another_condition = false

 if condition && another_condition
    puts "In TRUE block"
 elsif condition || another_condition
    puts "In ELSE IF block"
 else
    puts "In ELSE block"
 end