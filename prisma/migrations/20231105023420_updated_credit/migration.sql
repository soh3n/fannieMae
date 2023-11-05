/*
  Warnings:

  - Added the required column `isCredit` to the `Data` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Data" ADD COLUMN     "isCredit" BOOLEAN NOT NULL;
