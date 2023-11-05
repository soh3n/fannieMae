<template>
    <header>
        <h1>HowToHouse</h1>
    </header>
    
    <nav>
        <div>
            <nuxt-link to="/">HOME</nuxt-link>
            <a href="stats.html">TRENDS</a>
            <a href="approval_rate.html">APPROVAL RATE</a>
            <a href="calculator.html">CALCULATOR</a>
            <a href="about.html">ABOUT</a>
        </div>
    </nav>
    
    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
    </head>
    
    <body>
        <!-- <main>
            <form id="calculatorForm">
                <label for="creditScore">Credit Score: <output id="creditScoreValue">0</output></label>
                <input type="range" id="creditScore" required min="0" max="850" step="1" value="0"
                    oninput="document.getElementById('creditScoreValue').textContent = this.value">
    
                <label for="appraisedValue">Appraised Value: <output id="appraisedValueValue">0</output></label>
                <input type="range" id="appraisedValue" required min="0" max="500000" step="1" value="0"
                    oninput="document.getElementById('appraisedValueValue').textContent = this.value">
    
                <label for="downPayment">Down Payment: <output id="downPaymentValue">0</output></label>
                <input type="range" id="downPayment" required min="0" max="200000" step="1" value="0"
                    oninput="document.getElementById('downPaymentValue').textContent = this.value">
    
                <label for="grossMonthlyIncome">Gross Monthly Income: <output
                        id="grossMonthlyIncomeValue">0</output></label>
                <input type="range" id="grossMonthlyIncome" required min="0" max="10000" step="1" value="0"
                    oninput="document.getElementById('grossMonthlyIncomeValue').textContent = this.value">
    
                <label for="creditCardPayment">Credit Card Payment: <output id="creditCardPaymentValue">0</output></label>
                <input type="range" id="creditCardPayment" required min="0" max="2000" step="1" value="0"
                    oninput="document.getElementById('creditCardPaymentValue').textContent = this.value">
    
                <label for="carPayment">Car Payment: <output id="carPaymentValue">0</output></label>
                <input type="range" id="carPayment" required min="0" max="500" step="1" value="0"
                    oninput="document.getElementById('carPaymentValue').textContent = this.value">
    
                <label for="studentLoanPayments">Student Loan Payments: <output
                        id="studentLoanPaymentsValue">0</output></label>
                <input type="range" id="studentLoanPayments" required min="0" max="450" step="1" value="0"
                    oninput="document.getElementById('studentLoanPaymentsValue').textContent = this.value">
    
                <label for="interestRate">Interest Rate (%): <output id="interestRateValue">0</output></label>
                <input type="range" id="interestRate" required min="0" max="10" step="0.01" value="0"
                    oninput="document.getElementById('interestRateValue').textContent = this.value">
    
                <label for="loanTerm">Loan Term (years): <output id="loanTermValue">0</output></label>
                <input type="range" id="loanTerm" required min="1" max="30" step="1" value="0"
                    oninput="document.getElementById('loanTermValue').textContent = this.value">
    
                <button type="button" @click="calculateEligibility()">Check Eligibility</button>
            </form>
    
            <div id="results">
                <h2>Eligibility Results</h2>
                <p class="result" id="eligibilityStatus"></p>
                <p id="suggestions"></p>
            </div>
        </main> -->

        <div>
            <form @submit.prevent="calculateEligibility">
                <label for="creditScore">Credit Score: <output>{{ creditScore }}</output></label>
                <input v-model="creditScore" type="range" id="creditScore" required min="0" max="850" step="1" />
          
                <label for="appraisedValue">Appraised Value: <output>{{ appraisedValue }}</output></label>
                <input v-model="appraisedValue" type="range" id="appraisedValue" required min="0" max="500000" step="1" />
          
                <label for="downPayment">Down Payment: <output>{{ downPayment }}</output></label>
                <input v-model="downPayment" type="range" id="downPayment" required min="0" max="200000" step="1" />
          
                <label for="grossMonthlyIncome">Gross Monthly Income: <output>{{ grossMonthlyIncome }}</output></label>
                <input v-model="grossMonthlyIncome" type="range" id="grossMonthlyIncome" required min="0" max="10000" step="1" />
          
                <label for="creditCardPayment">Credit Card Payment: <output>{{ creditCardPayment }}</output></label>
                <input v-model="creditCardPayment" type="range" id="creditCardPayment" required min="0" max="2000" step="1" />
          
                <label for="carPayment">Car Payment: <output>{{ carPayment }}</output></label>
                <input v-model="carPayment" type="range" id="carPayment" required min="0" max="500" step="1" />
          
                <label for="studentLoanPayments">Student Loan Payments: <output>{{ studentLoanPayments }}</output></label>
                <input v-model="studentLoanPayments" type="range" id="studentLoanPayments" required min="0" max="450" step="1" />
          
                <label for="interestRate">Interest Rate (%): <output>{{ interestRate }}</output></label>
                <input v-model="interestRate" type="range" id="interestRate" required min="0" max="10" step="0.01" />
          
                <label for="loanTerm">Loan Term (years): <output>{{ loanTerm }}</output></label>
                <input v-model="loanTerm" type="range" id="loanTerm" required min="1" max="30" step="1" />
          
                <button type="button" @click="calculateEligibility">Check Eligibility</button>
            </form>

            <div id="eligibilityStatus"></div>
            <div id="suggestions"></div>

            <div id="barChartContainer">
                <div class="bar" style="height: {{ creditScore }}%"></div>
                <div class="bar" style="height: {{ ltv }}%"></div>
                <div class="bar" style="height: {{ dti }}%"></div>
                <div class="bar" style="height: {{ fedti }}%"></div>
              </div>
        </div>

    
       
    </body>    
</template>

<script>
export default {
  data() {
    return {
        creditScore: 0,
        appraisedValue: 0,
        downPayment: 0,
        grossMonthlyIncome: 0,
        creditCardPayment: 0,
        carPayment: 0,
        studentLoanPayments: 0,
        interestRate: 0,
        loanTerm: 0,
    };
  },
  methods: {
    calculateEligibility() {
      const {
        creditScore,
        appraisedValue,
        downPayment,
        grossMonthlyIncome,
        creditCardPayment,
        carPayment,
        studentLoanPayments,
        interestRate,
        loanTerm,
      } = this;

                // Check if any of the input fields are empty or have invalid values
                if (isNaN(appraisedValue) || isNaN(downPayment) || isNaN(grossMonthlyIncome) ||
                    isNaN(creditCardPayment) || isNaN(carPayment) || isNaN(studentLoanPayments) ||
                    isNaN(interestRate) || isNaN(loanTerm)) {
                    alert('Please fill in all fields with valid values before checking eligibility.');
                    return;
                }

            // Calculate Loan Amount
            const loanAmount = appraisedValue - downPayment;

            // Calculate Monthly Interest Rate
            const monthlyInterestRate = interestRate / 100 / 12;

            // Calculate Number of Payments
            const numberOfPayments = loanTerm * 12;

            // Calculate Monthly Mortgage Payment
            const monthlyMortgagePayment = loanAmount * (monthlyInterestRate * Math.pow(1 + monthlyInterestRate, numberOfPayments)) / (Math.pow(1 + monthlyInterestRate, numberOfPayments) - 1);

            // Perform eligibility checks
            // let eligible = true;

            let suggestions = [];

            if (creditScore < 640) {
                suggestions.push("Improve your credit score to 640 or above.");
            }

            const ltv = (loanAmount / appraisedValue) * 100;
            if (ltv >= 80) {
                suggestions.push("Consider making a higher down payment to lower your LTV ratio.");
            }
            
            const dti = ((creditCardPayment + carPayment + monthlyMortgagePayment)/grossMonthlyIncome)*100;
            if (dti >= 43) {
                suggestions.push("Lower your monthly debt payments or increase your income to improve your DTI ratio.");
            }

            const fedti = (monthlyMortgagePayment) / grossMonthlyIncome * 100;
            if (fedti >= 28) {
                suggestions.push("Consider looking for a less expensive home to lower your front-end debt to income ratio.");
            }

            const eligibilityStatus = document.getElementById('eligibilityStatus');
            const suggestionsElement = document.getElementById('suggestions');

            if (suggestions.length === 0) {
                eligibilityStatus.innerHTML = `<span class="icon">&#10003;</span><span class="eligible">Eligible</span>`;
                suggestionsElement.innerHTML = "";
                console.log(creditCardPayment, carPayment, studentLoanPayments, monthlyMortgagePayment, grossMonthlyIncome, dti);
            } else {
                eligibilityStatus.innerHTML = `<span class="icon">&#10007;</span><span class="not-eligible">Not Eligible</span>`;
                suggestionsElement.innerHTML = "You are not eligible for a home purchase. Please review your information and consider the following suggestions:\n<ul>" +
                    suggestions.map(suggestion => `<li>${suggestion}</li>`).join('') + "</ul>";
                console.log(monthlyMortgagePayment, grossMonthlyIncome, fedti)
                console.log(creditCardPayment, carPayment, studentLoanPayments, monthlyMortgagePayment, grossMonthlyIncome, dti);
            }

      // Log eligibility status to console
      
    },
    updateBarChart() {
      const bars = document.querySelectorAll('.bar');
      const values = [creditScore, ltv, dti, fedti];

      bars.forEach((bar, index) => {
        bar.style.height = `${values[index]}%`;
      });
    },
  }
}
</script>

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

    main {
        margin: 20px;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input,
    select {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #444;
    }

    .result {
        font-weight: bold;
        margin-top: 10px;
    }

    .eligible {
        color: green;
    }

    .not-eligible {
        color: red;
    }

    .icon {
        font-size: 1.2em;
        margin-right: 5px;
    }

    #barChartContainer {
        display: flex;
        justify-content: space-around;
        align-items: flex-end;
        height: 300px;
      }
    
      .bar {
        width: 20px;
        background-color: #3498db; /* Adjust color as needed */
        margin-bottom: 5px;
        transition: height 0.5s ease-in-out;
      }
</style>
