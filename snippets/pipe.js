/**
 * Script Name : pipe.js
 * Description : Describe what this JavaScript file does
 * Usage       : node pipe.js
 */
const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.output,
  terminal: false,
});

const log = (arg) => console.log(arg);

rl.on("line", function (line) {
  log(
    "LINE",
    line.split(" ").reduce((sum, x) => sum + +x, 0),
  );
});
