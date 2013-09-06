<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner">
			<img src="${resource(dir: 'images', file: 'BillsPayment_logo.jpg')}"/>
		</div>
		
		<div class="loginNav">
          	<sec:ifNotLoggedIn>
          	<g:if test="${params.controller != 'login'}">
    				<a class="log" href="${createLink(uri: '/login/index')}"> Login </a>
			</g:if>
			</sec:ifNotLoggedIn>
    			<sec:ifLoggedIn>
    		${applicationContext.springSecurityService.currentUser.getUsername()} | 
    				<a class="log" href="${createLink(uri: '/logout/index')}">Logout</a>
			</sec:ifLoggedIn>
		</div>
		<div id="clear"></div>

		<div class="mainNav nav" role="navigation">
		    	<sec:ifLoggedIn>
				<sec:ifAnyGranted roles="ADMIN">
				<span class="menuButton">
				<ul>
					<li><a class="main" href="${createLink(controller: 'branch')}"> Branch </a></li>
					<li><a class="main" href="${createLink(controller: 'teller')}"> Users </a></li>
					<li><a class="main" href="${createLink(controller: 'institution')}"> Institutions </a></li>
					
					<li><g:link action="list" controller="auditLog" href="${createLink(controller: 'auditLog')}"> Transaction Logs </g:link></li><%--
					
					<li><a class="main" href="${createLink(controller: 'customer')}"> Customers </a></li>
					--%><%--<li><a class="main" href="${createLink(controller: 'userRole')}"> Role Assignment </a></li>--%>
				</ul>
				</span>
				</sec:ifAnyGranted>
		
				<sec:ifAnyGranted roles="TELLER">
				<span class="menuButton">
				<ul>
					<li><a class="main" href="${createLink(controller: 'payment')}"> Bills Payments </a></li>
					<%-- <li><a class="main" href="${createLink(controller: 'bankAccount')}">Customer Accounts</a></li>
					<li><a class="main" href="${createLink(controller: 'bill')}"> Bills </a></li>--%>
					<%--<li><a class="main" href="${createLink(controller: 'report')}"> Report </a></li> should contain the report section in payment/list--%>
				</ul>
				</span>
				</sec:ifAnyGranted>
			</sec:ifLoggedIn>
		</div>
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo">
			©2013 Institute of Computer Science, University of the Philippines - Los Baños <br/> 
		</div>
		<div id="spinner" class="spinner" style="display:none;">
			<g:message code="spinner.alt" default="Loading&hellip;"/>
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
		
	</body>
</html>
