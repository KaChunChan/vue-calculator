<template>
  <div class="calculator">
    <div class="grid-container">
      <div class="grid-item" id="display">{{ display }}</div>
      <button class="grid-item top-btn" @click="clearBtn">AC</button>
      <button class="grid-item top-btn" @click="negateBtn">±</button>
      <button class="grid-item top-btn" @click="percentageBtn">%</button>
      <button class="grid-item operator-btn" @click="divideBtn">÷</button>
      <button class="grid-item" @click="appendBtn('7')">7</button>
      <button class="grid-item" @click="appendBtn('8')">8</button>
      <button class="grid-item" @click="appendBtn('9')">9</button>
      <button class="grid-item operator-btn" @click="multiplyBtn">x</button>
      <button class="grid-item" @click="appendBtn('4')">4</button>
      <button class="grid-item" @click="appendBtn('5')">5</button>
      <button class="grid-item" @click="appendBtn('6')">6</button>
      <button class="grid-item operator-btn" @click="subtractBtn">-</button>
      <button class="grid-item" @click="appendBtn('1')">1</button>
      <button class="grid-item" @click="appendBtn('2')">2</button>
      <button class="grid-item" @click="appendBtn('3')">3</button>
      <button class="grid-item operator-btn" @click="additionBtn">+</button>
      <button class="grid-item" id="zero-btn" @click="appendBtn('0')">0</button>
      <button class="grid-item" @click="appendDotBtn">.</button>
      <button class="grid-item operator-btn" @click="equalBtn">=</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Calculator",
  data() {
    return {
      display: "0",
      output: "0",
      baseNumber: 0,
      newNumber: 0,
      operator: null,
      equalBtnPressed: false,
      selectedOperator: "",
    };
  },
  methods: {
    updateDisplay() {
      this.display = this.output;
    },
    clearBtn() {
      this.display = "0";
      this.output = "0";
      this.baseNumber = 0;
      this.newNumber = 0;
      this.operator = null;
      this.equalBtnPressed = false;
      this.selectedOperator = "0;";
    },
    appendBtn(value) {
      this.selectedOperator = "";
      if (this.output.charAt(0) === "0" && this.output.charAt(1) !== ".") {
        this.output = "";
      }
      this.output += value;
      this.updateDisplay();
    },
    appendDotBtn() {
      this.selectedOperator = "";
      if (this.output.indexOf(".") < 0) {
        this.output += ".";
      }
      this.updateDisplay();
    },
    negateBtn() {
      if (this.output !== "0") {
        let value = parseFloat(this.output) * -1;
        this.output = "" + value;
        this.updateDisplay();
      }
    },
    percentageBtn() {
      this.output = "" + parseFloat(this.output) / 100;
    },
    readEntry() {
      this.newNumber = parseFloat(this.output);
    },
    updateOutputAndBaseNumber() {
      this.output = this.operator(this.baseNumber, this.newNumber);
      this.baseNumber = this.output;
    },
    equalBtn() {
      if (this.selectedOperator !== "") {
        this.newNumber = this.baseNumber;
      }
      if (!this.equalBtnPressed && this.selectedOperator === "") {
        this.newNumber = parseFloat(this.output);
        this.equalBtnPressed = true;
      }
      this.updateOutputAndBaseNumber();
      this.updateDisplay();
      this.output = "0";
    },
    additionBtn() {
      if (this.selectedOperator === "addition") return;
      this.equalBtnPressed = false;
      this.readEntry();
      this.operator = (a, b) => a + b;
      this.updateOutputAndBaseNumber();
      this.updateDisplay();
      this.output = "0";
      this.selectedOperator = "addition";
    },
    subtractBtn() {
      if (this.selectedOperator === "subtraction") return;
      this.equalBtnPressed = false;
      this.readEntry();
      if (this.operator === null) {
        this.newNumber *= -1;
      }
      this.operator = (a, b) => a - b;
      this.updateOutputAndBaseNumber();
      this.updateDisplay();
      this.output = "0";
      this.selectedOperator = "subtraction";
    },
    multiplyBtn() {
      if (this.selectedOperator === "multiplication") return;
      this.readEntry();
      if (this.operator === null) {
        this.baseNumber = 1;
      }
      this.operator = (a, b) => a * b;
      if (this.equalBtnPressed) {
        this.output = this.baseNumber;
      } else {
        this.output = this.operator(this.baseNumber, this.newNumber);
      }
      if (!this.equalBtnPressed) {
        this.baseNumber = this.output;
      }
      this.equalBtnPressed = false;
      this.updateDisplay();
      this.output = "0";
      this.selectedOperator = "multiplication";
    },
    divideBtn() {
      if (this.selectedOperator === "division") return;
      this.readEntry();
      let firstEntry = false;
      if (this.operator === null) {
        firstEntry = true;
      }
      this.operator = (a, b) => a / b;
      if (firstEntry) {
        this.output = this.newNumber;
      } else {
        if (this.equalBtnPressed) {
          this.output = this.baseNumber;
        } else {
          this.output = this.operator(this.baseNumber, this.newNumber);
        }
      }
      this.equalBtnPressed = false;
      this.baseNumber = this.output;
      this.updateDisplay();
      this.output = "0";
      this.selectedOperator = "division";
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.calculator {
  width: 500px;
  margin: 0 auto;
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: minmax(50px, auto);
}

.grid-item {
  background-color: darkgrey;
  border: 1px solid rgba(0, 0, 0, 0.8);
  padding: 20px;
  font-size: 30px;
  text-align: center;
}

#zero-btn {
  grid-column: 1 / span 2;
}

#display {
  background-color: white;
  grid-column: 1 / span 4;
}

.operator-btn {
  background-color: orange;
}

.top-btn {
  background-color: grey;
}
</style>
