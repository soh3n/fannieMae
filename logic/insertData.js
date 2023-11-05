import fs from 'fs';
import csv from 'csv-parser';
import { PrismaClient } from '@prisma/client';

// Create an instance of the Prisma client
const prisma = new PrismaClient();

// Read the CSV file and insert data into the Prisma model
let idCounter = 1;

fs.createReadStream('yes.csv')
  .pipe(csv())
  .on('data', async (row) => {
    try {
      // Increment the idCounter for each entry
      const data = {
        id: idCounter++,
        grossMonthlyIncome: parseInt(row.GrossMonthlyIncome),
        creditCardPayment: parseInt(row.CreditCardPayment),
        cardPayment: parseInt(row.CarPayment),
        studentLoanPayments: parseInt(row.StudentLoanPayments),
        appraisedValue: parseInt(row.AppraisedValue),
        downPayment: parseInt(row.DownPayment),
        loanAmount: parseInt(row.LoanAmount),
        monthlyMortgagePayment: parseInt(row.MonthlyMortgagePayment),
        creditScore: parseInt(row.CreditScore),
        isCredit: row.credit_check === 'TRUE',
        isLTV: row.ltv_check === 'TRUE',
        isDTI: row.dti_check === 'TRUE',
        isFEDTI: row.fedti_check === 'TRUE',
        isApproved: row.YesOrNo === 'TRUE',
        userId: parseInt(row.ID),
      };

      // Insert data into the "Data" table using Prisma
      await prisma.data.create({
        data,
      });

      console.log(`Data for ID ${data.id} inserted successfully.`);
    } catch (error) {
      console.error(`Error inserting data for ID ${idCounter}:`, error);
    }
  })
  .on('end', async () => {
    // Disconnect from the database after inserting all data
    await prisma.$disconnect();
  });
