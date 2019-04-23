/**
 *验证email格式是否正确
 */
function isEmail(strEmail){
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
	return true;
	else
	alert("the email format is wrong");
}


/**
 *判断字符串str是否包含substr
 */
function isContains(str, substr){
    return str.indexOf(substr) >= 0;
}



/**
 *
 */
function operationArray(array){
    var res=[];
	for(var i = 0;i<array.length;)  
	{  
	 var count = 0;  
	 for(var j=i;j<array.length;j++)  
	 {  
	       
	  if(array[i] == array[j])  
	  {  
	   count++;  
	  }  
	    
	 }  
	 res.push([array[i],count]);  
	 i+=count;  
	   
	}  
	return res;
}
/**
 *根据radio的name属性获取被选中radio的值
 */
function  getRadioBoxValue(radioName){       //根据radio的name属性获取被选中radio的值
	  var obj = document.getElementsByName(radioName);  //这个是以标签的name来取控件
	  for(i=0; i<obj.length;i++){
	      if(obj[i].checked){ 
	         return   obj[i].value; 
	      } 
	   }         
	   return "undefined";       
} 
/**
 *POST方式传参
 */
function post(URL, PARAMS) {
    var temp = document.createElement("form");
    temp.action = URL;
    temp.method = "post";
    temp.style.display = "none";
    for (var x in PARAMS) {
      var opt = document.createElement("textarea");
      opt.name = x;
      opt.value = PARAMS[x];
      temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    temp.submit();
    return temp;
  }