window.onload = function(){

	let frm = document.getElementById('frm');
	let inputs = document.querySelectorAll("input");

    frm.onsubmit = function(evt){
        //evt.stopPropagation();
        //evt.preventDefault();
        if(!frm.agree.checked){
            alert("반드시 확인하세요");
            // (1) return false; // return true;
            // (2) evt.stopPropagation()
//                 evt.preventDefault() 하고 아래 frm.submit();
            return;
        }
    }
    
 

}