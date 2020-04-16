package com.great.utils;

import com.baidu.aip.face.AipFace;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

/**
 * @author Administrator
 */
public class SchoolFaceRecognitionUtils
{


	//设置APPID/AK/SK
	public static final String APP_ID = "19446731";
	public static final String API_KEY = "AkYr6VikhFD3iNE0GSvffu2P";
	public static final String SECRET_KEY = "dHYNyDAyte3NgYWqkq9u3q70UMWhy15C";

	// 初始化一个AipFace
	public static AipFace client =new AipFace(APP_ID, API_KEY, SECRET_KEY);

	public SchoolFaceRecognitionUtils()
	{


	}

	/**
	 * 传入图片的Base64字符串信息 去服务器比对是否有这个人
	 * @param imageString
	 * @param id
	 */
	public static String identify(String imageString,Integer id) {
//        文档地址
//        http://ai.baidu.com/docs#/Face-Java-SDK/top
		String imageType = "BASE64";



		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);

		// 可选：设置代理服务器地址, http和socket二选一，或者均不设置
//        client.setHttpProxy("proxy_host", proxy_port);  // 设置http代理
//        client.setSocketProxy("proxy_host", proxy_port);  // 设置socket代理

		// 传入可选参数调用接口，根据需求自行设置
		HashMap<String, String> options = new HashMap<String, String>(10);
		//最大检测图片中的几个人脸
        options.put("max_face_num", "2");
        //返回的匹配相似度最低达到
        options.put("match_threshold", "80");
        //活体检测 检测为生物的可能性（不知道啥）
        options.put("liveness_control", "LOW");
        //要检测的库  我那边创建了三个 但实际用到的就一个AllFace
		String groupIdList = "test";
		//查找方法 传入Base64的字符串 字符串类型 要查询的库列表 要查询的选项（上面）
		JSONObject res = client.search(imageString, imageType,groupIdList, options);

		//输出查看查询到的结果Json
		System.out.println(res.toString());

		//判断是否有匹配的对象
		if (res.getString("error_msg") != null && res.getString("error_msg").equals("SUCCESS")) {

			//找到返回的第一个用户
			JSONObject jsonObject = res.getJSONObject("result").getJSONArray("user_list").getJSONObject(0);


			System.out.println("匹配得分：" + jsonObject.getInt("score"));

			System.out.println("分组的id：" + jsonObject.getString("group_id"));

			System.out.println("user_id：" + jsonObject.getString("user_id"));

			int userid = Integer.parseInt(jsonObject.getString("user_id"));

			if(userid != id)
			{
				return "error";//未匹配到符合人脸信息
			}

			if(jsonObject.getInt("score") < 95)
			{
				return "again";//再次验证
			}else
			{
				return "success";//验证成功
			}

		} else {
			System.out.println(res.toString());
			return "error";//未匹配到符合人脸信息
		}
	}

	/**
	 * 人脸注册方法
	 * @param imageString
	 * @param user_id
	 */
	public static String faceRegister(String imageString,String user_id){
		// 传入可选参数调用接口，根据需求自行设置
		String result = null;
		HashMap<String, String> options = new HashMap<String, String>(10);
		String imageType = "BASE64";

		if (imageString!=null&&!"".equals(imageString)&&user_id!=null&&!"".equals(user_id)){

			JSONObject res =client.addUser(imageString,imageType,"test",user_id,options);
			System.out.println(res);

			if(res.getString("error_msg") != null && res.getString("error_msg").equals("SUCCESS"))
			{
				result =  "success";//录入成功
			}else
			{
				result =  "error";//录入失败
			}
		}else
		{
			result  = "error2";//网络错误
		}

		return result;

	}







	/**
	 * 把路径下的文件转化成Base64的字符串格式 用来改发送验证图片
	 * @param filePath
	 * @return
	 */
	public static String fileToBase64(String filePath) {
		//将图片文件转化为字节数组字符串，并对其进行Base64编码处理
		InputStream in = null;
		byte[] data = null;
		//读取图片字节数组
		try {
			in = new FileInputStream(filePath);
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new String(Base64.encodeBase64(data));
	}


}
