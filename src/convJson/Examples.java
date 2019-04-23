package convJson;
import java.util.ArrayList;

//引入阿里巴巴JSON库，用于将arraylist table，转换为前台需要的数组
import com.alibaba.fastjson.JSON;
public class Examples {
	// 阿里巴巴JSON库使用例子，将一个ArrayList<ArrayList<String>>转化为字符串，
	// 而该字符串表示的是jsp前台使用的数组
	// 直接在action中使用函数体里面的语句
	// 另注，这个对象将会以json返回iu到前台
	// 随后调用 js/json2table/json2table.js 中的 json2table 指令将结果显示在页面上
	public void runInAction(){
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		String ajaxResultTable = "";
		ajaxResultTable = JSON.toJSONString(result, true);
		System.out.println(ajaxResultTable);
		
	}
	
}
