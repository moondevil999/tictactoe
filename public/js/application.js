$(document).ready(function() {

  var game = {}
  game["player1"] = $('#player1-inp').val();
  game["player2"] = $('#player2-inp').val();
  game["player_turn"] = null

  function gamestart(){

  }


  $('.col').on('click',function(){
    this.innerHTML = "X";
  });


});

