package gov.gsa.ads

import gov.gsa.ads.graph.Link
import gov.gsa.ads.graph.Node
import grails.transaction.Transactional


/**
 * Service class used for retrieving all drug data
 * @author Matt
 *
 */
@Transactional
class DrugService {
	def fdaClientService
	
	/**
	 * Gets the number of requested drug events for the supplied date range
	 * @param from from date (yyyyMMdd) as String
	 * @param to to date (yyyyMMdd) as String
	 * @param limit number of records to be returned as int
	 * @return Collection of DrugEvent objects that match input parameters
	 */
	def getDrugEventsForDateRange(def from, def to, def limit) {
		def results = new ArrayList()
		//Get all the records for the supplied date range
		def data = fdaClientService.searchEventsByNounAndDateRange("drug", from, to, limit)
			
		//Iterate through the map
		data.results.each{event ->
			//convert to domain object for easier manipulation
			DrugEvent drugEvent = new DrugEvent(eventId: event.safetyreportid,
												receiveDate:event.receivedate,
												age: event.patient.patientonsetage, 
												gender: (event.patient.patientsex == "1")?"Male":"Female",
												//for the purpose of this proto-type, we're only going to use the first drug
												drug:event.patient.drug.medicinalproduct.get(0),
												reactions: event.patient.reaction.reactionmeddrapt)
			results.add(drugEvent)
	
		}
		return results
	}

	/**
	 * Converts DrugEvent domain object to Nodes and Links and then populates an array.  Root node and link (Fatal for now)
	 * is first created - everything branches off of this.  A Collection of unique DrugEvent drugs is pulled from the 
	 * events data.  Then for each unique drug all corresponding events are retrieved, nodes and links created, array populated 
	 * and returned.
	 * @param events Collection DrugEvent objects
	 * @return Array Array [String, Collection] 
	 */
	def convertEventsToNodesLinksArray(def events) {
		def links = new ArrayList()
		def nodes = new ArrayList()
		def height = 550
		def width = 960
		int linkCount = 0
		def fatal = new Link()
		fatal.source = linkCount
		
		links.add(fatal)
		
		def fatalNode = new Node()
		fatalNode.x = width/5
		fatalNode.y = height/3
		fatalNode.label = "Fatal Rxn"
		nodes.add(fatalNode)

		//TODO reduce or break this apart
		def u = events.findAll().unique{it.drug}
		u.each {drug ->
			def drugLink = new Link()
			
			drugLink.source = fatal.source
			++linkCount
			drugLink.target = linkCount
			links.add(drugLink)
			
			def drugNode = new Node()
			drugNode.x = width/5
			drugNode.y = height/(linkCount+1)
			drugNode.label = drug.drug
			nodes.add(drugNode)
			
			Closure query = { it.drug == drug.drug }
			events.findAll(query).each{event ->
				def eventLink = new Link()
				eventLink.source = drugLink.target
				++linkCount
				eventLink.target = linkCount
				links.add(eventLink)
				
				def eventNode = new Node()
				eventNode.x = drugNode.x/3
				eventNode.y = drugNode.y/(linkCount+2)
				eventNode.label = event.receiveDate
				nodes.add(eventNode)
			}

		}

		def graph = [:]
		graph.put("links", links)
		graph.put("nodes", nodes)
		return graph
	}
}
