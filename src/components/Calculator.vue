<template>
  <div class="calulator">
    <div class="grid-container">
      <div class="grid-item" id="output-display"> {{ output }}</div>
      <button class="grid-item top-button" @click="clear">AC</button>
      <div class="grid-item top-button">±</div>
      <div class="grid-item top-button">%</div>
      <div class="grid-item operator-button">÷</div>
      <div class="grid-item">7</div>
      <div class="grid-item">8</div>
      <div class="grid-item">9</div>
      <div class="grid-item operator-button">x</div>
      <div class="grid-item">4</div>
      <div class="grid-item">5</div>
      <div class="grid-item">6</div>
      <div class="grid-item operator-button">-</div>
      <div class="grid-item">1</div>
      <div class="grid-item">2</div>
      <div class="grid-item">3</div>
      <div class="grid-item operator-button">+</div>
      <div class="grid-item" id="zero-button">0</div>
      <div class="grid-item">.</div>
      <div class="grid-item operator-button">=</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Calculator",
  data() {
    return {
      output: "123"
    }
  }, 
  methods: {
    clear() {
      this.output = ""
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.grid-container {
  display: grid;
  grid-template-columns: repeat(4,1fr);
  grid-auto-rows: minmax(50px, auto);
}

.grid-item {
  background-color: darkgrey;
  border: 1px solid rgba(0, 0, 0, 0.8);
  padding: 20px;
  font-size: 30px;
  text-align: center;
}

#zero-button {
  grid-column: 1 / span 2;
}


#output-display {
  background-color: white;
  grid-column: 1 / span 4;

}

.operator-button {
  background-color: orange;
}

.top-button {
  background-color: grey;
}

</style>
