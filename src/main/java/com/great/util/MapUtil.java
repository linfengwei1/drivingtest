package com.great.util;


import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapUtil
{

    //获取xml文件路径

    public String getXmlPath(Object object){
        try {
            String className = object.getClass().getName();
            String xml =  className.substring(className.lastIndexOf(".") + 1) + ".xml";
            return object.getClass().getResource(xml).toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    //字段--属性关系建立
    public Map<String, String> getMap(String xmlPath) throws Exception{
        SAXBuilder saxBuilder = new SAXBuilder();
        Document document = saxBuilder.build(xmlPath);

        Map<String, String> tableAndBeanMap = new HashMap<String, String>();

        Element rootElement = document.getRootElement();
        Element tableElement = rootElement.getChild("table");
        tableAndBeanMap.put("table_name", tableElement.getAttributeValue("name"));
        tableAndBeanMap.put("class_name", tableElement.getAttributeValue("class"));

        List<Element> props = tableElement.getChildren("property");
        for (Element prop : props) {
            tableAndBeanMap.put(prop.getAttributeValue("name"),
                    prop.getAttributeValue("column"));
        }

        return tableAndBeanMap;
    }

    public String createInsertSql(Object obj) throws  Exception{
        Map<String, String> map  = getMap(getXmlPath(obj));

        StringBuilder sb = new StringBuilder();
        sb.append("insert into ").append(map.get("table_name"))
                .append(" (");

        StringBuilder values = new StringBuilder();
        values.append(" )values(");
        Class clazz = obj.getClass();
        map.remove("table_name");
        map.remove("class_name");
        for (Map.Entry<String, String> entry : map.entrySet()) {
            //Field field = clazz.getDeclaredField(entry.getKey());

            sb.append(entry.getValue()).append(",");
            if(null == ReflectUtils.getValueByFieldName(obj, entry.getKey())){
                values.append("null,");
            }else{
                values.append("'")
                        .append(ReflectUtils.getValueByFieldName(obj, entry.getKey()))
                        .append("',");
            }

        }

        sb.delete(sb.length() - 1, sb.length());
        values.delete(values.length() - 1, values.length());
        values.append(")");
        sb.append(values.toString());

        return sb.toString();
    }


}
