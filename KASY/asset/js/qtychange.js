function adder(){
	var count=document.getElementById("countnum").innerHTML;
	count=parseInt(count)+1;
	document.getElementById("countnum").innerHTML=count;
}
function minuser(){
	var count=document.getElementById("countnum").innerHTML;
	if(count<=0){
		count=0;
	}else{
		count=parseInt(count)-1;
	}	
	document.getElementById("countnum").innerHTML=count;
}

function adder1(){
	var count=document.getElementById("countnum1").innerHTML;
	count=parseInt(count)+1;
	document.getElementById("countnum1").innerHTML=count;
}
function minuser1(){
	var count=document.getElementById("countnum1").innerHTML;
	if(count<=0){
		count=0;
	}else{
		count=parseInt(count)-1;
	}	
	document.getElementById("countnum1").innerHTML=count;
}

function adder2(){
	var count=document.getElementById("countnum2").innerHTML;
	count=parseInt(count)+1;
	document.getElementById("countnum2").innerHTML=count;
}
function minuser2(){
	var count=document.getElementById("countnum2").innerHTML;
	if(count<=0){
		count=0;
	}else{
		count=parseInt(count)-1;
	}	
	document.getElementById("countnum2").innerHTML=count;
}