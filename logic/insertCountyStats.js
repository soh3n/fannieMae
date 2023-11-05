import fs from 'fs';
import csv from 'csv-parser';
import { PrismaClient } from '@prisma/client';

// Create an instance of the Prisma client
const prisma = new PrismaClient();

let idCounter = 1;

// Read the CSV file and insert data into the Prisma model
fs.createReadStream('countystats.csv')
  .pipe(csv())
  .on('data', async (row) => {
    try {
      // Parse the CSV row and create the Zipcode data
      const countyData = {
        id: idCounter++,
        county: row.County,
        medianHomeValue: parseFloat(row.MedianHomeValue),
        medianAnnualProperty: parseFloat(row.MedianAnnualPropertyTaxPayment),
        avgPropertyTaxRate: parseFloat(row.AverageEffectivePropertyTaxRate),
      };

      // Insert data into the "Zipcode" table using Prisma
      await prisma.countyStats.create({
        data: countyData,
      });

      console.log(`Zipcode data for ID ${countyData.id} inserted successfully.`);
    } catch (error) {
      console.error(`Error inserting Zipcode data for ID ${row.ID}:`, error);
    }
  })
  .on('end', async () => {
    // Disconnect from the database after inserting all data
    await prisma.$disconnect();
  });