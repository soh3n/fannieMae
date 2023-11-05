import subprocess
import json
import pandas as pd

pd.set_option('mode.chained_assignment', None)

# Read CSV file
table = pd.read_csv('fanniemae.csv')
table['credit_check'] = [False for ele in range(10000)]
table['ltv_check'] = [False for ele in range(10000)]
table['dti_check'] = [False for ele in range(10000)]
table['fedti_check'] = [False for ele in range(10000)]
table['YesOrNo'] = [False for ele in range(10000)]

for n in range(10):
    flag_credit = 0
    flag_ltv = 0
    flag_dti= 0
    flag_fedti = 0
    mortgage = table.MonthlyMortgagePayment.iloc[n]
    
    if table.CreditScore[n] >= 640:
        flag_credit = 1
        table.credit_check.iloc[n] = True
        
        LTV = ((table.AppraisedValue.iloc[n] - table.DownPayment.iloc[n]) / table.AppraisedValue.iloc[n]) * 100
         
        if LTV < 80: 
            flag_ltv = 1
            table.ltv_check.iloc[n] = True
        elif 80 <= LTV <= 95: 
            PMI = LTV - 80
            mortgage = round(mortgage + ((table.AppraisedValue.iloc[n]) * ((PMI / 100) / 12)), 2)
            flag_ltv = 1
            table.ltv_check.iloc[n] = True
            
        DTI = ((table.CreditCardPayment.iloc[n] + table.CarPayment.iloc[n] + table.StudentLoanPayments.iloc[n] + mortgage) / table.GrossMonthlyIncome.iloc[n]) * 100
        FEDTI = (mortgage / table.GrossMonthlyIncome.iloc[n]) * 100

        if DTI <= 36 or DTI <= 43:
            flag_dti = 1 
            table.dti_check.iloc[n] = True
            if(flag_fedti < 28):
                flag_fedti = 1
                table.fedti_check.iloc[n] = True

        if flag_ltv and flag_dti and flag_credit and flag_fedti:
            table.YesOrNo.iloc[n] = True

# Convert Python list to JSON string
table_json = table.to_json(orient='records')

# Run the Node.js script with the required arguments
subprocess.run(["node", "path/to/prismaHandler.js", "insertDataIntoDatabase", table_json])