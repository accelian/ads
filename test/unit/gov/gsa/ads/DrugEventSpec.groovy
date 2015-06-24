package gov.gsa.ads

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class DrugEventSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test domain creation"() {
		given:
		def id = "1234"
		def date = "20150101"
		def drug = "asprin"
		
		when:
		def de = new DrugEvent(eventId:id, receiveDate:date, drug:drug)
		
		then:
		assert id == "1234"
		assert date == "20150101"
		assert drug == "asprin"
    }
}
