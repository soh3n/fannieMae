-- CreateTable
CREATE TABLE "Zipcode" (
    "id" INTEGER NOT NULL,
    "zipcode" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "county" TEXT NOT NULL,

    CONSTRAINT "Zipcode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "countyStats" (
    "id" INTEGER NOT NULL,
    "county" TEXT NOT NULL,
    "medianHomeValue" INTEGER NOT NULL,
    "medianAnnualProperty" INTEGER NOT NULL,
    "avgPropertyTaxRate" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "countyStats_pkey" PRIMARY KEY ("id")
);
