/*
  Warnings:

  - You are about to drop the column `estMonthlyMortgage` on the `Data` table. All the data in the column will be lost.
  - You are about to drop the column `homeAppraisedValue` on the `Data` table. All the data in the column will be lost.
  - You are about to drop the column `monthlyCar` on the `Data` table. All the data in the column will be lost.
  - You are about to drop the column `monthlyCreditCard` on the `Data` table. All the data in the column will be lost.
  - You are about to drop the column `studentLoan` on the `Data` table. All the data in the column will be lost.
  - Added the required column `appraisedValue` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cardPayment` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `creditCardPayment` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isApproved` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `loanAmount` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `monthlyMortgagePayment` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `studentLoanPayments` to the `Data` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Data" DROP COLUMN "estMonthlyMortgage",
DROP COLUMN "homeAppraisedValue",
DROP COLUMN "monthlyCar",
DROP COLUMN "monthlyCreditCard",
DROP COLUMN "studentLoan",
ADD COLUMN     "appraisedValue" INTEGER NOT NULL,
ADD COLUMN     "cardPayment" INTEGER NOT NULL,
ADD COLUMN     "creditCardPayment" INTEGER NOT NULL,
ADD COLUMN     "isApproved" BOOLEAN NOT NULL,
ADD COLUMN     "loanAmount" INTEGER NOT NULL,
ADD COLUMN     "monthlyMortgagePayment" INTEGER NOT NULL,
ADD COLUMN     "studentLoanPayments" INTEGER NOT NULL;
