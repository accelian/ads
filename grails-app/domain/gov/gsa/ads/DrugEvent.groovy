package gov.gsa.ads
/**
 * Domain class that holds converted JSON drug event data from FDA service 
 * @author Matt
 *
 */
class DrugEvent{
	String eventId
	String receiveDate
	String gender
	String age
	String drug	
	Collection drugReactions

    static constraints = {
		eventId (blank:false, unique:true)
    }
}
