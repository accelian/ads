package gov.gsa.ads

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
		when: 
			def results = service.convertEventsToNodesLinksArray(new ArrayList())
		then:
			assertTrue results != null
	}
}
