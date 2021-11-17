var PILLOLA = 1;
var DELTA_ENERGIA = 2;
var OSTACOLO=3;
var ARMA=2;
var SPINE=5;
var FANTASMA=7;
var SCUDO=6;
var ROSSA = 8;
var BLU = 9;

var omino = "omino";
var ominoConSpada = "ominoConSpada";
var ominoConScudo= "ominoConScudo";

var pathImg = "img1/";

// dichiarazione variabili di lavoro
var w = window.innerWidth -30;
var h = window.innerHeight-30;
var i=0;
var j=0;
var ENERGIA = 100;
var countPillole = 0;
var deltaenemy=4;
var speed=250;
var deltaPlayer=5;
document.getElementById("energia").innerHTML=ENERGIA;

/*
*
* Creazione del cacciatore
*
*/

function Cacciatore (nome,tipocaccia){
	this.nome = nome;
    this.tipocaccia = tipocaccia; 
}


Cacciatore.prototype.insegui = function () {
	
	
    var spostamento = document.getElementById(this.nome);
    // aggiornamento della posizione
	if (document.getElementById(this.nome).offsetTop< document.getElementById("image1").offsetTop) { spostamento.style.top = parseInt(spostamento.style.top) + deltaenemy + 'px'; }
	if (document.getElementById(this.nome).offsetTop > document.getElementById("image1").offsetTop) { spostamento.style.top = parseInt(spostamento.style.top) - deltaenemy + 'px';   }

	if (document.getElementById(this.nome).offsetLeft < document.getElementById("image1").offsetLeft) { spostamento.style.left = parseInt(spostamento.style.left) + deltaenemy + 'px'; }
	if (document.getElementById(this.nome).offsetLeft > document.getElementById("image1").offsetLeft) { spostamento.style.left = parseInt(spostamento.style.left) - deltaenemy + 'px';   }
    collides("cacciatore");
}

Cacciatore.prototype.inseguiRandom = function () {
    
    var spostamento = document.getElementById(this.nome);

    var dir = Math.round(Math.random());
    // dir può valere 0 o 1, javascript converte questi valori in false/true se li usiamo in espressioni boolean 
    if ((document.getElementById(this.nome).offsetLeft < document.getElementById("image1").offsetLeft) && dir) { spostamento.style.left = parseInt(spostamento.style.left) + deltaenemy + 'px';} else 
    if ((document.getElementById(this.nome).offsetLeft > document.getElementById("image1").offsetLeft) && dir) { spostamento.style.left = parseInt(spostamento.style.left) - 5 + 'px';  } else

    if ((document.getElementById(this.nome).offsetTop< document.getElementById("image1").offsetTop) && !dir) {  spostamento.style.top = parseInt(spostamento.style.top) + deltaenemy + 'px';} else
    if ((document.getElementById(this.nome).offsetTop > document.getElementById("image1").offsetTop) && !dir) { spostamento.style.top = parseInt(spostamento.style.top) - deltaenemy + 'px';} 
    collides("cacciatore");
}
Cacciatore.prototype.inseguiAlternato = function () {
    var spostamento = document.getElementById(this.nome);
    var dir = Math.round(Math.random());
    this.dir = !this.dir;
    // dir può valere 0 o 1, javascript converte questi valori in false/true se li usiamo in espressioni boolean 
    if ((document.getElementById(this.nome).offsetLeft < document.getElementById("image1").offsetLeft) && dir) { spostamento.style.left = parseInt(spostamento.style.left) + deltaenemy + 'px';}  
    if ((document.getElementById(this.nome).offsetLeft > document.getElementById("image1").offsetLeft) && dir) { spostamento.style.left = parseInt(spostamento.style.left) - deltaenemy + 'px';  } 

    if ((document.getElementById(this.nome).offsetTop< document.getElementById("image1").offsetTop) && !dir) {  spostamento.style.top = parseInt(spostamento.style.top) + deltaenemy + 'px';} 
    if ((document.getElementById(this.nome).offsetTop > document.getElementById("image1").offsetTop) && !dir) { spostamento.style.top = parseInt(spostamento.style.top) - deltaenemy + 'px';} 
	collides("cacciatore");
}


	


var ca=0;
function creaCacciatori(){
    var mn = document.getElementById("mondo");
    var img = document.createElement("img"); //Crea img
    img.src = pathImg  + FANTASMA+".jpg";
    img.id= ca.toString();
    img.className="fantasma";
    console.log("id cacciatore:" + img.id);
	rx = Math.floor(  Math.random() * h);
	ry = Math.floor( Math.random() * w);
    img.style.top=rx;
    img.style.left=ry;
    img.style.height=18;
    img.style.width=18;
    img.style.zIndex=-1;
    img.style.position="absolute";
    //console.log("rx:" +rx);
   
    mn.appendChild(img); //aggiunge img al mondo
    
}

var cacciatori = new Array();

function aggiungiCacciatori(){
    
    creaCacciatori();
    let idca = ca.toString(); 
    var inseguimento = Math.round(Math.random()*2);
    var cacciatore = new Cacciatore(idca,inseguimento);
    cacciatori.push(cacciatore);
    ca++;
}

let intervalcacciatori = setInterval("aggiungiCacciatori()", 8000); //Cacciatori aggiunti al mondo

let intervalmovimento = setInterval(function() { //Cacciatori che inseguono
    for (var i = 0; i < cacciatori.length; i++) {
      var caccia = cacciatori[i];
      if (caccia.tipocaccia==0) caccia.insegui(); 
      if (caccia.tipocaccia==1) caccia.inseguiRandom();
      if (caccia.tipocaccia==2) caccia.inseguiAlternato();
    }
  
  }, speed);




		
/*
*
* Timer
*
*/
var sec = 0;
function pad(val) {
    return val > 9 ? val : "0" + val;
}
var timer = setInterval(function () {
    document.getElementById("seconds").innerHTML = pad(++sec % 60);
    document.getElementById("minutes").innerHTML = pad(parseInt(sec / 60, 10));
}, 1000);

function aumentaDeltaEnemy(){
    if(deltaenemy<10) deltaenemy++;
}
setInterval("aumentaDeltaEnemy()",8000);

function aumentaSpeed(){
    if(speed>10) speed-=10;
    console.log("speed: " + speed);
    console.log("deltaeney: " + deltaenemy);
}
setInterval("aumentaSpeed()",8000);

function aumentaDeltaPlayer(){
    console.log("Adeltaplayer: " + deltaPlayer);
    deltaPlayer = 9;
    setTimeout("normalizzaDeltaPlayer()", 5000);
    console.log("Adeltaplayer: " + deltaPlayer);
}
function normalizzaDeltaPlayer(){
    console.log("Ndeltaplayer: " + deltaPlayer);
    deltaPlayer = 5;
    console.log("Ndeltaplayer: " + deltaPlayer);
}

/*
*
* Creazione oggetti
*
*/

var coin=0; 
var wall=0;
var spine=0;
var rossa=0
var blu=0;
function creaOggetti(){
    var oggetto = Math.round(Math.random()*4);
    if(oggetto==0){ // If del COIN
        var mn = document.getElementById("mondo");
        var img = document.createElement("img"); //Crea img
        img.src = pathImg  + PILLOLA+".jpg";
        img.id= coin + "c";
        img.className="coin";
        rx = Math.floor(  Math.random() * h);
        ry = Math.floor( Math.random() * w);
        img.style.top=rx;
        img.style.left=ry;
        img.style.height=18;
        img.style.width=18;
        img.style.zIndex=-1;
        img.style.position="absolute";
        coin++;
    }
    if(oggetto==1){ //If del OSTACOLO
        var mn = document.getElementById("mondo");
        var img = document.createElement("img"); //Crea img
        img.src = pathImg  + OSTACOLO +".jpg";
        img.id= wall + "w";
        img.className= "wall";

        rx = Math.floor(  Math.random() * h);
        ry = Math.floor( Math.random() * w);
        img.style.top=rx;
        img.style.left=ry;
        img.style.height=18;
        img.style.width=18;
        img.style.zIndex=-1;
        img.style.position="absolute";
        //console.log("rx:" +rx);
        wall++;
    }
    if(oggetto==2){ //If delle SPINE
        var mn = document.getElementById("mondo");
        var img = document.createElement("img"); //Crea img
        img.src = pathImg  + SPINE +".jpg";
        img.id= spine + "s";
        img.className= "spine";

        rx = Math.floor(  Math.random() * h);
        ry = Math.floor( Math.random() * w);
        img.style.top=rx;
        img.style.left=ry;
        img.style.height=18;
        img.style.width=18;
        img.style.zIndex=-1;
        img.style.position="absolute";
        //console.log("rx:" +rx);
        spine++;
    }
    if(oggetto==3){ //If delle pozioni rosse
        var mn = document.getElementById("mondo");
        var img = document.createElement("img"); //Crea img
        img.src = pathImg  + ROSSA +".jpg";
        img.id= rossa + "r";
        img.className= "rossa";

        rx = Math.floor(  Math.random() * h);
	ry = Math.floor( Math.random() * w);
        img.style.top=rx;
        img.style.left=ry;
        img.style.height=18;
        img.style.width=18;
        img.style.zIndex=-1;
        img.style.position="absolute";
        //console.log("rx:" +rx);
        rossa++;
    }
    if(oggetto==4){ //If delle pozioni blu
        var mn = document.getElementById("mondo");
        var img = document.createElement("img"); //Crea img
        img.src = pathImg  + BLU +".jpg";
        img.id= blu + "b";
        img.className= "blu";

        rx = Math.floor(  Math.random() * h);
        ry = Math.floor( Math.random() * w);
        img.style.top=rx;
        img.style.left=ry;
        img.style.height=15;
        img.style.width=15;
        img.style.zIndex=-1;
        img.style.position="absolute";
        //console.log("rx:" +rx);
        blu++;
    }
    mn.appendChild(img); //aggiunge img al mondo

}

let intervaloggetti = setInterval("creaOggetti()", 4000);

/*
*
* Gestione Energia
*
*/


function lessEnergy() {
    if (ENERGIA > 0) 
        ENERGIA --;
   
    document.getElementById("energia").innerHTML=ENERGIA;
    document.getElementById("barraenergia").style.width =   ENERGIA + "px";
    if(ENERGIA>50) document.getElementById("barraenergia").style.backgroundColor =   "#4CAF50";
    if(ENERGIA<50&&ENERGIA>=20) document.getElementById("barraenergia").style.backgroundColor =   " #ff6600";
    if(ENERGIA<20&&ENERGIA>0) document.getElementById("barraenergia").style.backgroundColor =   " #ff0000";
    if(ENERGIA==0){
        playAudio("fs");
        gameover();
    }
}

function moreEnergy(){
    if(ENERGIA<100)ENERGIA+=2;
     document.getElementById("energia").innerHTML=ENERGIA;
     document.getElementById("barraenergia").style.width =   ENERGIA + "px";
    if(ENERGIA>50) document.getElementById("barraenergia").style.backgroundColor =   "#4CAF50";
    if(ENERGIA<50&&ENERGIA>=20) document.getElementById("barraenergia").style.backgroundColor =   " #ff6600";
    if(ENERGIA<20&&ENERGIA>0) document.getElementById("barraenergia").style.backgroundColor =   " #ff0000";
}
   
/*
*
* Gestione suono
*
*/



function playAudio(id) { 
    var audio = new Audio(document.getElementById(id).src);
    audio.volume=0.50;
    audio.play();
}
function playAudioPugno(id) { 
    var pr =  Math.round(Math.random()*4);
    id = id +pr;
    var audio = new Audio(document.getElementById(id).src);
    audio.volume=0.50;
    audio.play();
}

function muteMe(elem) {
    elem.muted = true;
    elem.pause();
}

/*
*
* GAME OVER
*
*/

function gameover(){
    //Stop agli intervalli
    clearInterval(intervalcacciatori);
    clearInterval(intervaloggetti);
    clearInterval(timer);
    clearInterval(intervalmovimento);

    //Rimuove tutti gli elementi del mondo
    var imgs = document.querySelectorAll("img");
    for(let i=0; i<imgs.length;i++){
        var el = document.getElementById(imgs[i].id);
        el.parentNode.removeChild(el);
    }

    //Calcolo punteggio
    var minuti = parseInt(document.getElementById("minutes").textContent);
    var secondi= parseInt(document.getElementById("seconds").textContent);
    var pillole = parseInt(document.getElementById("pilloleprese").textContent);
    var punteggio = 0;
    if(pillole==0)   punteggio = secondi + (minuti*100);
    else  punteggio = (secondi + (minuti*100))*pillole;

    document.getElementById("punteggio").innerHTML=punteggio;
    document.getElementById("informazioni").style.visibility="hidden";
    document.getElementById("gameover").style.visibility="visible";
}