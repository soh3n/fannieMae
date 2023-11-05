import fs from 'fs';
import csv from 'csv-parser';
import { PrismaClient } from '@prisma/client';

// Create an instance of the Prisma client
const prisma = new PrismaClient();

let idCounter = 1;

// Read the CSV file and insert data into the Prisma model
fs.createReadStream('zipcodes.csv')
  .pipe(csv())
  .on('data', async (row) => {
    try {
      // Parse the CSV row and create the Zipcode data
      const zipcodeData = {
        id: idCounter++,
        zipcode: parseInt(row.Zip),
        city: row.City,
        county: row.County,
      };

      // Insert data into the "Zipcode" table using Prisma
      await prisma.zipcode.create({
        data: zipcodeData,
      });

      console.log(`Zipcode data for ID ${zipcodeData.id} inserted successfully.`);
    } catch (error) {
      console.error(`Error inserting Zipcode data for ID ${row.ID}:`, error);
    }
  })
  .on('end', async () => {
    // Disconnect from the database after inserting all data
    await prisma.$disconnect();
  });