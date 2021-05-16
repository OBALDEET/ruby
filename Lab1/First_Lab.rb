def numbers
  puts "Enter first number"
  num1 = $stdin.gets.to_i
  puts "Enter second number"
  num2 = $stdin.gets.to_i
  if (num1 == 20 || num2 == 20)
    puts 20
  else
    puts num1 + num2
  end
end

def name
  puts "Enter ur name"
  name = gets.chomp
  puts "Enter ur last name"
  last_name = gets.chomp
  puts "Enter ur age"
  age = $stdin.gets.to_i
  if age < 18
    puts "Привет, #{name} #{last_name}. Тебе меньше 18, но начать учиться программировать никогда не рано."
  else
    puts "Привет, #{name} #{last_name}. Самое время заняться делом."
  end
end

def main
  loop do
    puts "Введи 1, чтобы что? (1)"
    puts "Введи 2, чтобы что? (2)"
    puts "Введи -1, чтобы выйти"

    command = $stdin.gets.to_i

    case command
    when 1
      numbers
    when 2
      name
    when -1
      break
    end
  end
end


main
