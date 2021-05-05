# Bank tech test

This is a first version of my completed Bank Tech Test in Ruby. It stores a balance and allows the user to withdraw and deposit funds. It prints a statement listing transactions.

Simplecov reports 100% test coverage.

## Installation

* Clone this Repo
* cd to the project directory
* Bundle install (dependencies are rspec, simplecov and rubocop for testing, coverage and linting)

## Running tests

* cd to the project directory
* rspec to run tests

## Usage
``bash
irb -r './lib/bank.rb'
```
```ruby
bank = Bank.new
bank.deposit(200) # Adds 200 to the balance
bank.withdraw(100) # Adds 100 to the balance
bank.view_statement # Would return a statement in the following format: "date || credit || debit || balance\n2021-05-05 || 200.00 || || 200.00\n2021-05-05 || || 100.00 || 100.00"
bank.balance # Would return 100
```

## About this project

I have tried to refactor the code to make it as DRY as possible. I have not made any of the methods private, however the user cannot alter the balance without making a withdrawal or a deposit. Transactions are stored in an array as a transaction object. Printing a statement is the responsibility of its own class.

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit
