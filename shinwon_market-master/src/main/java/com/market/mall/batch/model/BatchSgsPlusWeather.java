/**
 * @PackageName: com.market.mall.ifcomm.weather.model
 * @FileName : SgsPlusWeather.java
 * @Date : 2015. 12. 4.
 * @프로그램 설명 : 날씨 Model Class
 * @author freelsj
 */
package com.market.mall.batch.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType (XmlAccessType.FIELD)
public class BatchSgsPlusWeather {

	private int weatherCode;
	private float temperature;
	private float minTemperature;
	private float maxTemperature;
	private float humidity;
	private float pressure;
	private float percentOfClouds;
	private float windSpeed;
	private String weatherDescription;
	private String weatherIconURL;

//	@XmlElementWrapper(name = "weatherProductList")
//	@XmlElement( name="weatherProduct" )
//	private List<WeatherProduct> weatherProductList;

	public BatchSgsPlusWeather() {
		temperature = Float.NaN;
		minTemperature = Float.NaN;
		maxTemperature = Float.NaN;
		humidity = Float.NaN;
		pressure = Float.NaN;
		percentOfClouds = Float.NaN;
		windSpeed = Float.NaN;
	}

	/**
	 * @return the weatherCode
	 */
	public int getWeatherCode() {
		return weatherCode;
	}

	/**
	 * @param weatherCode
	 *            the weatherCode to set
	 */
	public void setWeatherCode(int weatherCode) {
		this.weatherCode = weatherCode;
	}

	/**
	 * @return the temperature
	 */
	public float getTemperature() {
		return temperature;
	}

	/**
	 * @param temperature
	 *            the temperature to set
	 */
	public void setTemperature(float temperature) {
		this.temperature = temperature;
	}

	/**
	 * @return the minTemperature
	 */
	public float getMinTemperature() {
		return minTemperature;
	}

	/**
	 * @param minTemperature
	 *            the minTemperature to set
	 */
	public void setMinTemperature(float minTemperature) {
		this.minTemperature = minTemperature;
	}

	/**
	 * @return the maxTemperature
	 */
	public float getMaxTemperature() {
		return maxTemperature;
	}

	/**
	 * @param maxTemperature
	 *            the maxTemperature to set
	 */
	public void setMaxTemperature(float maxTemperature) {
		this.maxTemperature = maxTemperature;
	}

	/**
	 * @return the humidity
	 */
	public float getHumidity() {
		return humidity;
	}

	/**
	 * @param humidity
	 *            the humidity to set
	 */
	public void setHumidity(float humidity) {
		this.humidity = humidity;
	}

	/**
	 * @return the pressure
	 */
	public float getPressure() {
		return pressure;
	}

	/**
	 * @param pressure
	 *            the pressure to set
	 */
	public void setPressure(float pressure) {
		this.pressure = pressure;
	}

	/**
	 * @return the percentOfClouds
	 */
	public float getPercentOfClouds() {
		return percentOfClouds;
	}

	/**
	 * @param percentOfClouds
	 *            the percentOfClouds to set
	 */
	public void setPercentOfClouds(float percentOfClouds) {
		this.percentOfClouds = percentOfClouds;
	}

	/**
	 * @return the windSpeed
	 */
	public float getWindSpeed() {
		return windSpeed;
	}

	/**
	 * @param windSpeed
	 *            the windSpeed to set
	 */
	public void setWindSpeed(float windSpeed) {
		this.windSpeed = windSpeed;
	}

	/**
	 * @return the weatherDescription
	 */
	public String getWeatherDescription() {
		return weatherDescription;
	}

	/**
	 * @param weatherDescription
	 *            the weatherDescription to set
	 */
	public void setWeatherDescription(String weatherDescription) {
		this.weatherDescription = weatherDescription;
	}

	/**
	 * @return the weatherIconURL
	 */
	public String getWeatherIconURL() {
		return weatherIconURL;
	}

	/**
	 * @param weatherIconURL
	 *            the weatherIconURL to set
	 */
	public void setWeatherIconURL(String weatherIconURL) {
		this.weatherIconURL = weatherIconURL;
	}

	 
	 
}
