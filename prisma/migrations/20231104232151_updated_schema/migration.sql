/*
  Warnings:

  - Added the required column `isDTI` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isFEDTI` to the `Data` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isLTV` to the `Data` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Data" ADD COLUMN     "isDTI" BOOLEAN NOT NULL,
ADD COLUMN     "isFEDTI" BOOLEAN NOT NULL,
ADD COLUMN     "isLTV" BOOLEAN NOT NULL;
