PROGRAM TFSA_SIM
  IMPLICIT NONE
  INTEGER :: months, i
  REAL*8 :: balance, monthly_contrib, annual_return, monthly_return

  ! Parameters
  months = 30 * 12
  monthly_contrib = 500.0D0
  annual_return = 0.07D0
  monthly_return = (1.0D0 + annual_return)**(1.0D0/12.0D0) - 1.0D0

  balance = 0.0D0

  OPEN(UNIT=10, FILE="tfsa_growth.csv", STATUS="REPLACE")
  WRITE(10,*) "Month,Balance"

  DO i = 1, months
    balance = (balance + monthly_contrib) * (1.0D0 + monthly_return)
    WRITE(10,*) i, balance
  END DO

  CLOSE(10)

  PRINT*, "Simulation complete. Check tfsa_growth.csv."

END PROGRAM TFSA_SIM
