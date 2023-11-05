-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Data" (
    "id" INTEGER NOT NULL,
    "monthlyCar" INTEGER NOT NULL,
    "studentLoan" INTEGER NOT NULL,
    "estMonthlyMortgage" INTEGER NOT NULL,
    "creditScore" INTEGER NOT NULL,
    "grossMonthlyIncome" INTEGER NOT NULL,
    "monthlyCreditCard" INTEGER NOT NULL,
    "homeAppraisedValue" INTEGER NOT NULL,
    "downPayment" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Data_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
