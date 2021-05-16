class CashMachine
  attr_accessor :balance

  def initialize
    file_read = File.open("balance.txt", "r")
    file_info = file_read.readlines{|line| line.chomp}
    if file_info.empty?
      file_write = File.open("balance.txt", "w")
      file_write.write("100")
      @balance = 100
    else
      @balance = file_info[0].to_s
    end

  end

  def info
    puts "Your balance is #{@balance.to_i}"
  end

  def deposit
    puts "Введите сумму депозита"
    dep = gets.to_i
    if dep < 0
      puts "Нельзя внести отрицательную сумму на счёт"
    else
      @balance = @balance.to_i + dep
      puts "Your balance is #{@balance.to_i}"
    end
  end

  def withdraw
    puts "Введите сумму снятия"
    wth = gets.to_i
    if wth > @balance.to_i
      puts "Нельзя снять сумму, больше суммы баланса"
    else
      @balance = @balance.to_i - wth
      puts "Your balance is #{@balance.to_i}"
    end

  end

  def quit
    file = File.open("balance.txt", "w")
    file.write(@balance)
  end
end

def main
  loop do
    puts "Введите 1, чтобы воспользоваться Cash Machine"
    puts "Введите -1, чтобы выйти из программы"
    main_command = gets.chomp.to_i
    case main_command
    when 1
      damn_boy = CashMachine.new
      loop do
        puts "Введите одну из комманд B(Balance), D(Deposit), W(Withdraw) или Q(Quit)."
        command = gets.chomp.downcase
        case command
        when "b"
          damn_boy.info
        when "d"
          damn_boy.deposit
        when "w"
          damn_boy.withdraw
        when "q"
          damn_boy.quit
          break
        else
          puts "Введена неверная команда"
        end
      end
    when -1
      break
    end
  end
end

main