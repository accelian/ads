package gov.gsa.ads

import gov.gsa.ads.graph.Link
import gov.gsa.ads.graph.Node
import grails.test.mixin.*
import grails.test.mixin.support.GrailsUnitTestMixin
import grails.test.mixin.web.ControllerUnitTestMixin
import spock.lang.Specification

import com.google.gson.Gson

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */

@TestMixin([GrailsUnitTestMixin])
@Mock([DrugService])
@TestFor(DrugEventController)
class DrugEventControllerSpec extends Specification {
	def mockDrugService
	def json = ""
	def array = [:]
    def setup() {
		array.put("nodes", new ArrayList().add(new Node()))
		array.put("links", new ArrayList().add(new Link()))
		Gson gson = new Gson()
		json = gson.toJson(array)
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
			mockDrugService.demand.getDrugEventsForDateRange {def from, def to, def limit-> 
				return new ArrayList() 
			}
			mockDrugService.demand.convertEventsToNodesLinksArray {def events->
				return array
			}
			controller.drugService = mockDrugService.createMock()
			
		when:
			params.from == "20140101"
			params.to == "20150101"
	        controller.graph()
		

        then:
	        response.status == 200
			response.text == json
//		assert data != null
		
	}
}
