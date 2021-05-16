def first_script (num, word)
  one = word.size-2
  two = word.size-1
  if(word[one..two].include?("CS"))
    puts 2**word.size
  elsif
  puts word.reverse!
  end
end

def second_script
  puts "Сколько будет покемонов?"
  num_of_pockemons = gets.to_i
  pockemons_hash = Hash.new
  i = 0
  while i < num_of_pockemons do
    puts "Введите имя покемона"
    name = gets.chomp
    puts "Введите цвет покемона"
    color = gets.chomp
    pockemons_hash[name] = color
    i += 1
  end
  pockemons_hash.each { |key, value| puts "#{key} #{value}" }
end

def main
  loop do
    puts "Введите 1, чтобы запустить скрипт со словами"
    puts "Введите 2, чтобы запустить скрипт с покемонами"
    puts "Введите -1, чтобы выйти из программы"
    command = gets.to_i
    case command
    when 1
      puts "Введите число(Но зачем?)"
      num = gets.to_i
      puts "Введите слово"
      word = gets.chomp
      first_script(num, word)
    when 2
      second_script
    when -1
      break
    end
  end
end

main
