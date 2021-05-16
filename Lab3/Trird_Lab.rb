def read_file (age = gets.to_i)
  file = File.open("input.txt")
  file_data = file.readlines.map{|line| line.chomp}
  file.close

  res_file = File.open("result.txt", "w")
  file_data.each do |data|
    if data.include?(age.to_s)
      res_file.write(data + "\n")
    end
  end
  res_file.close

  result_file = File.open("result.txt")
  res_file_data = result_file.readlines.map{|line| line.chomp}
  print res_file_data
  puts ""
end

def open_file
  if File.exist?("balance.txt")
    file = File.open("balance.txt")
  else
    file = File.open("balance.txt", "w+")
    file.puts("100")
    file.close
  end
end

def deposit
  file = File.open("balance.txt")
  file_data = file.readlines.map{|line| line.chomp}
  current_balance = file_data[0]
  file.close
  puts "Enter Sum"
  sum = gets.chomp
  if sum.to_i < 0
    puts "Невозможно пополнить счет на отрицательную сумму"
  end
  file_write = File.open("balance.txt", "w")
  new_balance = sum.to_i + current_balance.to_i
  file_write.write(new_balance)
  file_write.close
end

def withdraw
  file = File.open("balance.txt")
  file_data = file.readlines.map{|line| line.chomp}
  current_balance = file_data[0]
  file.close
  puts "Enter Sum"
  sum = gets.chomp
  if sum.to_i < 0
    puts "Невозможно снять со счета отрицательную сумму"
  elsif sum.to_i > current_balance.to_i
    puts "На счету недостаточно средств"
    return -1
  end
  file_write = File.open("balance.txt", "w")
  new_balance = current_balance.to_i - sum.to_i
  file_write.write(new_balance)
  file_write.close
end

def balance
  file = File.open("balance.txt")
  file_data = file.readlines.map{|line| line.chomp}
  puts file_data[0]
  file.close
end

def bank_account
  open_file
  loop do
    puts "Enter the command: B(balance); W(withdraw); D(deposit); Q(quit)."
    command = gets.chomp
    case command.downcase
    when "b"
      balance
    when "w"
      withdraw
    when "d"
      deposit
    when "q"
      return -1
    end
  end
end

def main
  loop do
    puts "Введите 1, чтобы работать с функцией записи сутдентов в другой файл"
    puts "Введите 2, чтобы работать с банковским счётом"
    puts "Введите -1, чтобы выйти"
    command = gets.to_i
    case command
    when 1
      puts "Введите нужный возраст"
      read_file
    when 2
      bank_account
    when -1
      break
    end
  end
end

main
#where you find this?