import grails.util.Environment

import com.rural.bank.Requestmap
import com.rural.bank.Role
import com.rural.bank.User
import com.rural.bank.UserRole

class BootStrap {
	def init = { servletContext ->
		switch(Environment.current) {
			case Environment.DEVELOPMENT:
	//create an admin account
				def adminRole = Role.findByAuthority("ADMIN") ?: new Role(authority: "ADMIN", description:  "Administrator").save(failOnError: true)
				if (!User.findByUsername("admin")) {
					def admin = new User(username:"admin", password:"admin", enabled:true).save(failOnError: true)
					new UserRole(user: admin, role: adminRole).save(failOnError: true)
				}
	//create a default teller account
				def tellerRole = Role.findByAuthority("TELLER") ?: new Role(authority: "TELLER", description:  "Rural Bank Teller").save(failOnError: true)
				if (!User.findByUsername("teller")) {
					def teller = new User(username:"teller", password:"teller", enabled:true).save(failOnError: true)
					new UserRole(user: teller, role: tellerRole).save(failOnError: true)
				}
				setupRequestMap()
				break
			default:
				break
	}
		

	}
	
// REQUEST MAPPING 
	private def setupRequestMap() {
		Requestmap.findByUrl("/images/**") ?: new Requestmap(url: "/images/**", configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/css/**") ?: new Requestmap(url: "/css/**", configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/js/**") ?: new Requestmap(url: "/js/**", configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/login/**") ?: new Requestmap(url: "/login/**", configAttribute:"IS_AUTHENTICATED_ANONYMOUSLY").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/logout/**") ?: new Requestmap(url: "/logout/**", configAttribute:"IS_AUTHENTICATED_FULLY").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/") ?: new Requestmap(url: "/", configAttribute:"IS_AUTHENTICATED_FULLY").save(flush: true, failOnError: true)

	//TODO add Requestmapping for TELLER - specify which pages a TELLER can access
		Requestmap.findByUrl("/teller/**") ?: new Requestmap(url: "/teller/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/branch/**") ?: new Requestmap(url: "/branch/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/institution/**") ?: new Requestmap(url: "/institution/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)
/*		Requestmap.findByUrl("/customer/**") ?: new Requestmap(url: "/customer/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/user/**") ?: new Requestmap(url: "/user/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/userRole/**") ?: new Requestmap(url: "/userRole/**", configAttribute:"hasRole('ADMIN')").save(flush: true, failOnError: true)*/
		
		Requestmap.findByUrl("/payment/**") ?: new Requestmap(url: "/payment/**", configAttribute:"hasRole('TELLER')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/bill/**") ?: new Requestmap(url: "/bill/**", configAttribute:"hasRole('TELLER')").save(flush: true, failOnError: true)
		Requestmap.findByUrl("/bankAccount/**") ?: new Requestmap(url: "/bankAccount/**", configAttribute:"hasRole('TELLER')").save(flush: true, failOnError: true)
	}
	
	def destroy = {
	}	
}
