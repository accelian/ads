package gov.gsa.ads

import gov.gsa.ads.graph.Link
import gov.gsa.ads.graph.Node
import grails.converters.JSON
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import grails.test.mixin.web.ControllerUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(DrugEventController)
@TestMixin(ControllerUnitTestMixin)

@Mock([DrugService])
class DrugEventControllerSpec extends Specification {
	def mockDrugService
    def setup() {
		
    }

    def cleanup() {
    }

    void "test index"() {
		when:
			controller.index()
		then:
			response.status == 200
    }

	void "test graph json request"() {
		given:
			mockDrugService = mockFor(DrugService)
			mockDrugService.demand.getDrugEventsForDateRange("", "", 1) {-> 
				return "" 
			}
			mockDrugService.demand.convertEventsToNodesLinksArray(new ArrayList()) {->
				def array = [:]
				array.put("nodes", new ArrayList().add(new Node()))
				array.put("links", new ArrayList().add(new Link()))	
				return array as JSON
			}
			
			controller.drugService = mockDrugService.createMock()
		when:"test when graph method is call"
			
			request.method = 'GET'
			request.contentType = "application/json"
			response.format = 'json'
			def json = controller.graph()
		then:
			assertTrue response.status == 200
			assertNotNull json
	}
}
