package gov.gsa.ads

import gov.gsa.ads.graph.Node

import grails.test.mixin.Mock

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(DrugService)
@TestMixin(GrailsUnitTestMixin)
@Mock([FdaClientService, DrugEvent])
class DrugServiceSpec extends Specification {
	
    def setup() {
		
    }

    def cleanup() {
		
    }

    void "test get drug events for date range"() {
		given:
			FdaClientService.metaClass.searchEventsByNounAndDateRange = {
				return ""
			}
		when:
			def results = service.getDrugEventsForDateRange("20140101", "20140201", 1)
		then:
			assertTrue results != null
    }
	
	void "test convert drug events to array"() {
		given:
			def events = new ArrayList()
			def d1 = new DrugEvent()
			d1.eventId = "1"
			d1.receiveDate = "20140501"
			d1.drug = "aspirin"
			events.add(d1)
			
			def d2 = new DrugEvent()
			d2.eventId = "2"
			d2.receiveDate = "20140502"
			d2.drug = "aspirin"
			events.add(d2)
			
			def d3 = new DrugEvent()
			d3.eventId = "3"
			d3.receiveDate = "20140503"
			d3.drug = "iodine"
			events.add(d3)
			
			def d4 = new DrugEvent()
			d4.eventId = "4"
			d4.receiveDate = "20140504"
			d4.drug = "xanax"
			events.add(d4)
			
			def d5 = new DrugEvent()
			d5.eventId = "5"
			d5.receiveDate = "20140505"
			d5.drug = "xanax"
			events.add(d5)
			
		when: 
			def results = service.convertEventsToNodesLinksArray(events)

		then:
			assert results != null
			List links = results.get("links")
			List nodes = results.get("nodes")
			assert links.size() == 9
			assert nodes.size() == 9
			assert nodes.get(0).label == "Fatal Rxn"
			assert nodes.get(1).label == "aspirin"
			assert nodes.get(3).label == "20140502"
			assert nodes.get(4).label == "iodine"
			assert nodes.get(5).label == "20140503"
			assert nodes.get(6).label == "xanax"
			assert nodes.get(7).label == "20140504"
			assert nodes.get(8).label == "20140505"
			
			assert links.get(0).source == 0
			assert links.get(0).target == 0
			assert links.get(1).source == 0
			assert links.get(1).target == 1
			assert links.get(2).source == 1
			assert links.get(2).target == 2
			assert links.get(3).source == 1
			assert links.get(3).target == 3
			assert links.get(4).source == 0
			assert links.get(4).target == 4
			assert links.get(5).source == 4
			assert links.get(5).target == 5
			assert links.get(6).source == 0
			assert links.get(6).target == 6
			assert links.get(7).source == 6
			assert links.get(7).target == 7
			assert links.get(8).source == 6
			assert links.get(8).target == 8
			
	}
}
