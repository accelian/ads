package gov.gsa.ads

import gov.gsa.ads.graph.Link
import gov.gsa.ads.graph.Node
import grails.converters.JSON
/**
 * Controller to handle all in coming requests for drug event data
 * @author Matt
 *
 */
class DrugEventController {
	def drugService
	/**
	 * Set up method.  Nothing needed at this time
	 * 
	 */
    def index() { 
		
	}
	/**
	 * Called by D3 force graph on page load to get the data for request
	 * @return String JSON string array of links and nodes for graph
	 */
	def graph() {
		def events = drugService.getDrugEventsForDateRange("20140101", "20150619", 100) //yyyyMMdd
		def graph = drugService.convertEventsToNodesLinksArray(events)
	
		render graph as JSON
	}
}
