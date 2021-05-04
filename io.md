INPUT               ||    OUTPUT
-------------------------------------------------
balance                 0
// Deposits
deposit(500)            500
(consecutively)
deposit(1000)           1500

deposit(80.00)          80
deposit(-10)            invalid deposit
deposit(sdg)            invalid deposit
deposit(56.1212412)     invalid deposit

//Withdrawals
--starting with a zero balance
withdraw(10)      ||    invalid withdrawal

---with any balance
withdraw(-10)     ||    invalid withdrawal
withdraw(sdg)     ||    invalid withdrawal
withdraw(56.12412)||    invalid withdrawal


--starting with 600
withdraw(2000)   ||     debit exceeds balance
withdraw(200)    ||     400
