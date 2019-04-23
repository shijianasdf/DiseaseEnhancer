package convJson;

import java.util.ArrayList;

public class ArrayList2String {
		//获得数组再转换成json String，
		//把获得的ArrayList<ArrayList<String>>和名称字符串，转换成对标准json格式；
		public String arrayList2String (ArrayList<ArrayList<String>> arrayListTable, String jsonName) {
			String jsonstring = "";
			ArrayList<String> arraylist = new ArrayList<String>();
			ArrayList<String> jsonarraylist = new ArrayList<String>();
			ArrayList<ArrayList<String>> jsonarraylistarray = new ArrayList<ArrayList<String>>();
			String[] jsonNameArray = jsonName.split(",");
			if(arrayListTable.isEmpty()){
				System.out.println("Your arrayListTable is empty,please cheak it!");
				return jsonstring;
			}
			if(arrayListTable.get(0).size() != jsonNameArray.length){
				System.out.println("Your jsonName is not equal to json-element number,please cheak it!");
				return jsonstring;
				
			}
			for(int ouindex = 0;ouindex < arrayListTable.size();ouindex++){
				arraylist = arrayListTable.get(ouindex);
				jsonarraylist = new ArrayList<String>();	//重新初始化；
				for(int inindex = 0;inindex < arraylist.size();inindex++){
					//System.out.println(arraylist.get(inindex));
					jsonarraylist.add("\""+jsonNameArray[inindex]+"\":\""+arraylist.get(inindex)+"\"");
				}
				jsonarraylistarray.add(jsonarraylist);
			}
			//System.out.println(jsonarraylistarray.toString());
			jsonstring = jsonarraylistarray.toString().replace("[", "{");
			jsonstring = jsonstring.replace("]", "}");
			jsonstring = "["+jsonstring.substring(1,jsonstring.length()-1)+"]";
			//System.out.println(jsonstring);
			return jsonstring;
		}

}
