package gov.gsa.ads

import grails.test.mixin.*
import groovy.json.JsonSlurper
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(FdaClientService)
@Mock([])
class FdaClientServiceSpec extends Specification {
	def service
    def setup() {
		service = new FdaClientService()
		
    }

    def cleanup() {
		service = null
    }

    void "test search for drug events by date range"() {
		given:
			def noun = "drug"
			def from = "20140101"
			def to = "20150101"
			def limit = 1
			
			URL.metaClass.getText = {
				["meta":"data"]
			}
			
			JsonSlurper.metaClass.parseText = {
				["success":"success"]
			}
		when:
			def results = service.searchEventsByNounAndDateRange(noun, from, to, limit)
		then:
			assertTrue results == ["success":"success"]
    }
}
