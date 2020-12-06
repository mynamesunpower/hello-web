

document.addEventListener('DOMContentLoaded', function() {
		
  let list = document.getElementById('list');
  let pic = document.getElementById('pic');
  let del = document.getElementById('del');

  // 리스트에서 선택(클릭했을 때)
    list.onclick = function(evt) {
        let isbn = evt.target.getAttribute('data-isbn');
        //alert(isbn);
        // <img src="" width="100px" height="70px">
        let img = document.createElement('img');
        img.width = 110;
        img.height = 150;
        img.src = "./images/" + isbn + ".jpg";
        if(pic.getElementsByTagName('img').length > 0){
            pic.replaceChild(img, pic.firstChild);    
        }
        else {
            pic.appendChild(img);
            del.disabled = false;
        }
    }
    
    

  
  // 삭제 버튼 누르면 pic 아래 자식(img 태그)를 지운다
    del.onclick = function() {
        pic.removeChild(pic.lastChild);
        del.disabled = true;
    }
  
});