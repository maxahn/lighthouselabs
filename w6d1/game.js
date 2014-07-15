starts $100
bet $5 ... $10
Guess 1...10
true = 2x bet
offby1 = no win no lose
false = lose bet

Game end with money <= 0


var cash = 100


function bet(amount, guess){
  var answer = Math.floor((Math.random() * 10) + 1);
  alert("did you guess " + answer + "? because if not you probably lost.")
  var amount = parseInt(amount);
  if (answer === guess){
    cash += amount;
    return "You win, you now have: $" + cash;
  } else if (answer != guess + 1 && answer != guess - 1) {
    cash -= amount;
    return "You lose, you now have: $" + cash;
  } else {
    return "Bet again, you still have: $" + cash;
  }

}

while (cash > 0){
  if (cash < 5){
    var amount = prompt("You have $" + cash + " left, bet all?", cash)
  } else{
    var amount = prompt("Bet $5 to $10")
  }
  var guess = prompt("Guess a number between 1 and 10")
  alert(bet(amount, guess))
}


