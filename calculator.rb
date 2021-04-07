# ask the user for two numbers
# ask the user for an operation
# perform the operation on the numbers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.match?(/[[:digit:]]/)
end

def number?(num)
  num.kind_of?(Float) || num.kind_of?(Integer)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

number1 = ''
number2 = ''
result = ''

config = {
  welcome: "Welcome to calculator! Enter your name:",
  name: "Make sure to use a valid name",
  first: "What is the first number?",
  not_valid: "Hmm.. that is not quite a valid number",
  second: "What is the second number?",
  choose: "Must choose 1, 2, 3, or 4",
  another: "Do you want to perform another calculation? (Y to continue)",
  thank_you: "Thank you for using calculator!",
}

prompt(config[:welcome])
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(:name)
  else
    break
  end
end

loop do
  loop do
    prompt(config[:first])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(config[:not_valid])
    end
  end

  loop do
    prompt(config[:second])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(config[:not_valid])
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(config[:choose])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")
  prompt(config[:another])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
prompt(config[:thank_you])
