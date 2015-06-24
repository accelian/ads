package gov.gsa.ads

import groovy.json.JsonSlurper

/**
 * Client for consuming FDA web service.  This service handles retrieving
 * all data from the FDA web service.
 *
 * @author Matt
 *
 */
class FdaClientService {

	/**
	 * Calls the event json end point for the supplied noun, date range and number of records
	 * @param noun the type of search to perform - drug; device and food
	 * @param from from date (yyyyMMdd) as String
	 * @param to to date (yyyyMMdd) as String
	 * @param limit the number of records to be returned as int
	 * @return String of json data
	 */
	def searchEventsByNounAndDateRange(def noun, def from, def to, def limit) {
		def response
		try {
			response = new JsonSlurper().parseText(new URL("https://api.fda.gov/${noun}/event.json?search=receivedate:[${from}+TO+${to}]&limit=${limit}").text)
			//TODO catch error replies - 
			// no records found

		} catch(Exception e) {
			//TODO meaningful exception that will bubble up to user
			println "EXCEPTION : "
			println e
		}
		return response
	}
}
