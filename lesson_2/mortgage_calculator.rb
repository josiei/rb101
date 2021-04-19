require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc.yml')

loan_amt = ''
loan_dur_months = ''
apr = ''

def prompt(message)
  puts("=> #{message}")
end

def valid_num?(num)
  (num != '0') && num.match?(/[[:digit:]]/)
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['loan_amount'])
  loan_amt = gets.chomp
  break if valid_num?(loan_amt)
  prompt(MESSAGES['not_valid'])
end

loop do
  prompt(MESSAGES['apr'])
  apr = gets.chomp
  break if valid_num?(apr)
  prompt(MESSAGES['not_valid'])
end

loop do
  prompt(MESSAGES['duration'])
  loan_dur = gets.chomp
  prompt(MESSAGES['months_or_years'])
  months_or_years = gets.chomp
  if months_or_years.downcase.start_with?('y')
    loan_dur_months = loan_dur.to_f * 12
  else
    loan_dur_months = loan_dur.to_f
  end
  break if valid_num?(loan_dur)
  prompt(MESSAGES['not_valid'])
end

monthly_interest_rate = (apr.to_f / 12.0) / 100.0

monthly_payment = loan_amt.to_f * (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-loan_dur_months)))

prompt("Your monthly payment is #{monthly_payment}")
