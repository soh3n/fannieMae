import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const deleteData = async () => {
  await prisma.Data.deleteMany({});
  //await prisma.countyStats.deleteMany({});
  //await prisma.zipcode.deleteMany({});
};

deleteData().then(() => {
  console.log('Database emptied successfully.');
  prisma.$disconnect();
}).catch(error => {
  console.error('Error emptying database:', error);
});
