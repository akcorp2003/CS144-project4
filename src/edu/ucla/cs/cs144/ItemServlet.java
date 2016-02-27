package edu.ucla.cs.cs144;

import java.io.IOException;
import java.io.StringReader;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

public class ItemServlet extends HttpServlet implements Servlet {
       
    public ItemServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // your codes here
    	try{
    		String id = request.getParameter("id");
    		//if no id is provided, the "id" attribute will be null
    		if(id == null || id == ""){
    			request.setAttribute("empty", "true");
    			request.getRequestDispatcher("/item.jsp").forward(request, response);
    			return;
    		}
    		String itemxml = AuctionSearchClient.getXMLDataForItemId(id);
    		

    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder builder = factory.newDocumentBuilder();
   			InputSource is = new InputSource(new StringReader(itemxml));
    		Document doc = builder.parse(is);
    		
    		Item item = new Item();
    		item.item_id = id;
    		item.name = doc.getElementsByTagName("Name").item(0).getTextContent();
    		if(doc.getElementsByTagName("Buy_Price").item(0) != null) {
				item.buy_price = doc.getElementsByTagName("Buy_Price").item(0).getTextContent();
			}
			else{
				item.buy_price = "N/A"; //to avoid warnings on MySQL
			}
    		item.first_bid = doc.getElementsByTagName("First_Bid").item(0).getTextContent();
    		item.num_bids = doc.getElementsByTagName("Number_of_Bids").item(0).getTextContent();
    		Element n_userid = (Element) doc.getElementsByTagName("Seller").item(0);
			item.seller_id = n_userid.getAttribute("UserID");
    		item.seller_rating = n_userid.getAttribute("Rating");
    		
    		request.setAttribute("id", id);
    		request.setAttribute("item", item);
    		request.getRequestDispatcher("/item.jsp").forward(request, response);
    		
    	} catch(Exception e){
    		request.setAttribute("error", e.getMessage());
    		request.getRequestDispatcher("/item.jsp").forward(request, response);
    	}
    }
}
