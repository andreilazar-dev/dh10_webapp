

function leftArrowPressed() {
    var element = document.getElementById("image1");
    collides("omino")
    element.style.left = parseInt(element.style.left) - deltaPlayer  +'px';
  
}

function rightArrowPressed() {
    var element = document.getElementById("image1");
    collides("omino")
    element.style.left = parseInt(element.style.left) + deltaPlayer + 'px';
}

function upArrowPressed() {
    var element = document.getElementById("image1");
    collides("omino")
    element.style.top = parseInt(element.style.top) - deltaPlayer + 'px';
}

function downArrowPressed() {
    var element = document.getElementById("image1");
    collides("omino")
    element.style.top = parseInt(element.style.top) + deltaPlayer + 'px';
}

function moveSelection(event) {                    
    switch (event.keyCode) {
        case 37:
            leftArrowPressed();
        break;

        case 39:
            rightArrowPressed();
        break;

        case 38:
            upArrowPressed();
        break;

        case 40:
            downArrowPressed();
        break;
    }
}

// gestione dell'evento onkeypress:
function checkKeyPress (event){
    var chCode = ('charCode' in event) ? event.charCode : event.keyCode;

	switch(chCode){
    	case 100: rightArrowPressed();  break;
    	case 115: downArrowPressed();      break;
    	case 97:  leftArrowPressed(); break;
    	case 119: upArrowPressed();       break;
    }
    //alert ("The Unicode character code is: " + chCode);
}

// Onmouse Move
function myFunction(e) {
    var x = e.clientX - 10;
    var y = e.clientY -10  ;

    var element = document.getElementById("image1");
    collides("omino");
    /*element.animate({
        left: element.style.left+0.1*(x-element.style.left),
        top: element.style.top+0.1*(y-element.style.top) 
      }, 1, "linear"); 
      */
    element.style.top = y  + 'px';
    element.style.left =  x  + 'px';
    
  }

function gameLoop()
{
// change position based on speed
moveSelection();
setTimeout("gameLoop()",10);
}


/*
*
* Collision
*
*/

function collides(pof){ 
var  fantasmi= document.getElementsByClassName("fantasma");
  var omino= document.getElementById("image1");
  var monete= document.getElementsByClassName("coin"); //Questo è un array
  var  blue= document.getElementsByClassName("blu");
  var  rosse= document.getElementsByClassName("rossa");

if(pof=="omino"){ 
/*
* Omino prende le monete
*/
  for(var m=0; m<monete.length; m++){
    if (omino.offsetTop < monete[m].offsetTop + monete[m].width &&
        omino.offsetTop + omino.width > monete[m].offsetTop &&
        omino.offsetLeft < monete[m].offsetLeft +monete[m].height &&
        omino.offsetLeft + omino.height > monete[m].offsetLeft) {
            countPillole++;
            document.getElementById("pilloleprese").innerHTML=countPillole;
            playAudio("pm");
            var el = document.getElementById(monete[m].id);
            el.parentNode.removeChild(el);
           }
 }
/*
* Omino contro le spine
*/
var  spines= document.getElementsByClassName("spine");
 for(var m=0; m<spines.length; m++){
    if (omino.offsetTop < spines[m].offsetTop + spines[m].width &&
        omino.offsetTop + omino.width > spines[m].offsetTop &&
        omino.offsetLeft < spines[m].offsetLeft +spines[m].height &&
        omino.offsetLeft + omino.height > spines[m].offsetLeft) {
           lessEnergy();
           playAudio("sp");
        }
 }

 /*
* Omino prende pozione rossa, recupera energia
*/

for(var m=0; m<rosse.length; m++){
   if (omino.offsetTop < rosse[m].offsetTop + rosse[m].width &&
       omino.offsetTop + omino.width > rosse[m].offsetTop &&
       omino.offsetLeft < rosse[m].offsetLeft +rosse[m].height &&
       omino.offsetLeft + omino.height > rosse[m].offsetLeft) {
        moreEnergy();
        playAudio("pu");
           var el = document.getElementById(rosse[m].id);
            el.parentNode.removeChild(el);
           }
}

 /*
* Omino prende pozione blue, recupera energia
*/

for(var m=0; m<blue.length; m++){
   if (omino.offsetTop < blue[m].offsetTop + blue[m].width &&
       omino.offsetTop + omino.width > blue[m].offsetTop &&
       omino.offsetLeft < blue[m].offsetLeft +blue[m].height &&
       omino.offsetLeft + omino.height > blue[m].offsetLeft) {
            aumentaDeltaPlayer();
            playAudio("su");
           var el = document.getElementById(blue[m].id);
            el.parentNode.removeChild(el);
           
          }
}
}// End if dell'omino

/*
*Contro il muro
*/
 var walls= document.getElementsByClassName("wall");
 for(var m=0; m<walls.length; m++){
    if (omino.offsetTop < walls[m].offsetTop + walls[m].width &&
        omino.offsetTop + omino.width > walls[m].offsetTop &&
        omino.offsetLeft < walls[m].offsetLeft +walls[m].height &&
        omino.offsetLeft + omino.height > walls[m].offsetLeft) {
           
           }
 }
if(pof=="cacciatore"){ 
/*
* Fantasmi contro omino
*/
  //Questo è un array
 for(var m=0; m<fantasmi.length; m++){
   if (omino.offsetTop < fantasmi[m].offsetTop + fantasmi[m].width &&
       omino.offsetTop + omino.width > fantasmi[m].offsetTop &&
       omino.offsetLeft < fantasmi[m].offsetLeft +fantasmi[m].height &&
       omino.offsetLeft + omino.height > fantasmi[m].offsetLeft) {
            playAudioPugno("p");
            lessEnergy();          
          }
}

/*
* Fantasmi contro monete, eliminano le monete
*/

 for(var m=0; m<monete.length; m++){
     for(var f=0; f<fantasmi.length; f++){
        if (monete[m].offsetTop < fantasmi[f].offsetTop + fantasmi[f].width &&
            monete[m].offsetTop + monete[m].width > fantasmi[f].offsetTop &&
            monete[m].offsetLeft < fantasmi[f].offsetLeft +fantasmi[f].height &&
            monete[m].offsetLeft + monete[m].height > fantasmi[f].offsetLeft) {
                
               
                    var el = document.getElementById(monete[m].id);
                    el.parentNode.removeChild(el);
                
                
                
        }
    }
}
/*
* Fantasmi contro pozioni rosse, eliminano le pozioni
*/

for(var m=0; m<rosse.length; m++){
    for(var f=0; f<fantasmi.length; f++){
       if (rosse[m].offsetTop < fantasmi[f].offsetTop + fantasmi[f].width &&
        rosse[m].offsetTop + rosse[m].width > fantasmi[f].offsetTop &&
        rosse[m].offsetLeft < fantasmi[f].offsetLeft +fantasmi[f].height &&
        rosse[m].offsetLeft + rosse[m].height > fantasmi[f].offsetLeft) {
               
            playAudio("gb");
                   var el = document.getElementById(rosse[m].id);
                   el.parentNode.removeChild(el);
               
               
               
       }
   }
}

/*
* Fantasmi contro pozioni blu, eliminano le pozioni
*/

for(var m=0; m<blue.length; m++){
    for(var f=0; f<fantasmi.length; f++){
       if (blue[m].offsetTop < fantasmi[f].offsetTop + fantasmi[f].width &&
        blue[m].offsetTop + blue[m].width > fantasmi[f].offsetTop &&
        blue[m].offsetLeft < fantasmi[f].offsetLeft +fantasmi[f].height &&
        blue[m].offsetLeft + blue[m].height > fantasmi[f].offsetLeft) {
               
            playAudio("gb");
                   var el = document.getElementById(blue[m].id);
                   el.parentNode.removeChild(el);
               
               
               
       }
   }
}

}// End if dei cacciatori
 
}