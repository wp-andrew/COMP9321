package web.app.eng;

import java.io.*;
import java.util.*;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class NewsBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private NodeList newsList;
	private Integer[] searchedIndexes;
	
	public NewsBean() throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse("oregon.xml");
		newsList = doc.getDocumentElement().getChildNodes();
	}
	
	public int getLength() {
		return newsList.getLength();
	}
	
	public int getSearchedIndexesLength() {
		return searchedIndexes.length;
	}
	
	/**
	 * Pick n numbers between 0 (inclusive) and rowList.getLength() (exclusive)
	 */
	public Integer[] getRandomIndexes(int n) {
		if (n > newsList.getLength()) {
			throw new RuntimeException("Input a number less than " + newsList.getLength() + "!");
		}
		Random RANDOM = new Random();
		Set<Integer> picked = new HashSet<>();
		while (picked.size() < n) {
			picked.add(RANDOM.nextInt(newsList.getLength()));
		}
		return picked.toArray(new Integer[n]);
	}
	
	/**
	 * initialize searchedIndexes based on searched values 
	 */
	public void setSearchedIndexes(String tagName, String searchedValue, String searchedKeywords, 
								String searchedPeople, String searchedOrganizations, String searchedLocations) {
		Set<Integer> picked = new HashSet<>();
		for (int i=0; i<newsList.getLength(); i++) {
			do
			{
				try
				{
					if (searchedValue != null && searchedValue != "") {
						String tagValue = getTagValue(i, tagName);
						if (!Pattern.compile(Pattern.quote(searchedValue), Pattern.CASE_INSENSITIVE).matcher(tagValue).find()) {
							break;
						}
					}
					if (searchedKeywords != null && searchedKeywords != "") {
						String keywordsValue = getTagValue(i, "keywords");
						if (!Pattern.compile(Pattern.quote(searchedKeywords), Pattern.CASE_INSENSITIVE).matcher(keywordsValue).find()) {
							break;
						}
					}
					if (searchedPeople != null && searchedPeople != "") {
						String peopleValue = getTagValue(i, "people");
						if (!Pattern.compile(Pattern.quote(searchedPeople), Pattern.CASE_INSENSITIVE).matcher(peopleValue).find()) {
							break;
						}
					}
					if (searchedOrganizations != null && searchedOrganizations != "") {
						String organizationsValue = getTagValue(i, "organizations");
						if (!Pattern.compile(Pattern.quote(searchedOrganizations), Pattern.CASE_INSENSITIVE).matcher(organizationsValue).find()) {
							break;
						}
					}
					if (searchedLocations != null && searchedLocations != "") {
						String locationsValue = getTagValue(i, "locations");
						if (!Pattern.compile(Pattern.quote(searchedLocations), Pattern.CASE_INSENSITIVE).matcher(locationsValue).find()) {
							break;
						}
					}
				}
				catch (Exception e) {
					break;
				};
				picked.add(i);
			} while(false);
		}
		searchedIndexes = picked.toArray(new Integer[picked.size()]);
	}
	
	public String getTagValue(int idx, String tagName) {
		try {
			Element row = (Element) newsList.item(idx);
			return row.getElementsByTagName(tagName).item(0).getFirstChild().getNodeValue();
		}
		catch (Exception e) {
			return null;
		}
	}
	
	public String getSearchedTagValue(int idx, String tagName) {
		try {
			if (idx >= getSearchedIndexesLength()) {
				return null;
			}
			Element row = (Element) newsList.item(searchedIndexes[idx]);
			return row.getElementsByTagName(tagName).item(0).getFirstChild().getNodeValue();
		}
		catch (Exception e) {
			return null;
		}
	}
	
}
