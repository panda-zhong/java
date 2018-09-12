package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * propertiesUtil:
 * properties工具类,通过key值获取properties对应的value值
 * @author JMT24
 *
 */
public class PropertiesUtil {
	private static Properties props = new Properties();
	static {
		/**
		ClassLoader主要对类的请求提供服务，当JVM需要某类时，它根据名称向ClassLoader要求这个类，然后由ClassLoader返回这个类的class对象。
		通过ClassLoader从而将资源载入JVM  
		 */
		ClassLoader loder = PropertiesUtil.class.getClassLoader();
		/**
		 * 将properties文件通过输入流加载进类加载器
		 */
		// 路径从根目录路径开始
		InputStream ips = loder.getResourceAsStream("config/DB.properties");
		try {
			props.load(ips);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 通过properties文件的Key获得value
	 * @param key properties文件的key
	 * @return 与properties文件的key响应的value 
	 */
	public static String getValue(String key) {
		return props.getProperty(key);
	}

}
