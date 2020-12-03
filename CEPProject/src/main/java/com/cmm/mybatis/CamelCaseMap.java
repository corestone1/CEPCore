package com.cmm.mybatis;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.ibatis.type.Alias;

import com.google.common.base.CaseFormat;

@Alias("camelCaseMap")
public class CamelCaseMap extends ListOrderedMap{

	private static final long serialVersionUID = -3162701429871771131L;


	private String toProperCase(String s, boolean isCapital) {
		String rtnValue = "";
		
		if(isCapital) {
			rtnValue = s.substring(0,1).toUpperCase() + s.substring(1).toLowerCase();
		}else {
			rtnValue = s.toLowerCase();
		}
		
		return rtnValue;
	}
	
	private String toCamelCase(String s) {
		String[] parts = s.split("_");
		StringBuffer camelCaseString = new StringBuffer();
		
		for(int i=0; i<parts.length; i++) {
			String part = parts[i];
			camelCaseString.append(toProperCase(part, (i != 0?true:false)));
		}
		
		return camelCaseString.toString();
	}
	
	
	@Override
	public Object put(Object key, Object value) {
		//return super.put(toCamelCase((String)key),  String.valueOf(value));
		return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,  (String)key), value);
	}
}
