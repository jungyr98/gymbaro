package com.myspring.gymbaro02.common.GPS;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class GpsToAddress {
	double latitude;
	double longitude;
	String regionAddress;

	public GpsToAddress(double latitude, double longitude) throws Exception {
		this.latitude = latitude;
		this.longitude = longitude;
		this.regionAddress = getRegionAddress(getJSONData(getApiAddress()));
	}

	private String getApiAddress() {
		String apiURL = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latitude+","+longitude+"&language=ko&key=AIzaSyCk-KTEGLfLGD3L7w5IdR8-kxKIhrjD-o8";
		return apiURL;
	}

	private String getJSONData(String apiURL) throws Exception {
		String jsonString = new String();
		String buf;
		URL url = new URL(apiURL);
		URLConnection conn = url.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				conn.getInputStream(), "UTF-8"));
		while ((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		return jsonString;
	}

	private String getRegionAddress(String jsonString) {
		JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
		JSONArray jArray = (JSONArray) jObj.get("results");
		if( jArray.size()!=0){
		jObj = (JSONObject) jArray.get(0);
		}
		return (String) jObj.get("formatted_address");
	}

	public String getAddress() {
		return regionAddress;
	}
}
