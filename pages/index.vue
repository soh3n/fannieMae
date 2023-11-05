<template>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HowToHouse</title>
    </head>
    <body>
        <header>
            <h1>HowToHouse</h1>
        </header>
    
        <nav>
            <a href="home.html">HOME</a>
            <a href="frontend.html">ELIGIBILITY CHECKS</a>
            <a href="stats.html">TRENDS</a>
            <nuxt-link to="/calculator">CALCULATOR</nuxt-link>
        </nav>
    
        <main>
    
            <section class="eligibility-section">
                <h2>Eligibility Checks</h2>
    
                <div class="eligibility-box">
                    <h3>Credit Rating</h3>
                    <!-- <p>Credit rating should be 640 or above.</p> -->
                </div>
    
                <div class="eligibility-box">
                    <h3>LTV (Loan-to-Value)</h3>
                    <!-- <p>LTV < 80% is preferred, between 80% and 95% could lead to higher interest rates and require the purchase of mortgage insurance.</p> -->
                </div>
    
                <div class="eligibility-box">
                    <h3>DTI (Debt-to-Income Ratio)</h3>
                    <!-- <p>Gross income should be > $5000 per month. DTI <= 43% and FEDTI <= 28%.</p> -->
                </div>
    
                <div class="eligibility-box">
                    <h3>Front-end Debt-to-Income (FEDTI)</h3>
                    <!-- <p>FEDTI <= 28%.</p> -->
                </div>
            </section>
    
            <section class="eligibility-section">
                <h2>Suggestions</h2>
                <!-- <p>If the potential homebuyer does not meet the necessary criteria to purchase a home, you should evaluate several factors and provide one or more suggestions that will help improve the buyer's opportunity to buy a home in the future. These suggestions could include:</p> -->
                <ul>
                    <li>Pay off some current debt</li>
                    <li>Transfer debt to a lower interest rate loan/credit card</li>
                    <li>Look for a less expensive home</li>
                    <li>Increase your down payment amount</li>
                    <li>Continue renting while saving more for a down payment</li>
                </ul>
            </section>
        </main>
    
        <footer>
            &copy; 2023 HackUTD
        </footer>
    </body>
</template>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f8f8;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
}

main {
    margin: 20px;
}

footer {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
    position: fixed;
    bottom: 0;
    width: 100%;
}

nav {
    background-color: #444;
    padding: 10px;
    text-align: center;
}

nav a {
    color: #fff;
    text-decoration: none;
    margin: 10px;
}

nav a:hover {
    text-decoration: underline;
}

.eligibility-section {
    margin: 20px;
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
}

.eligibility-box {
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f8f8f8;
}
</style>
