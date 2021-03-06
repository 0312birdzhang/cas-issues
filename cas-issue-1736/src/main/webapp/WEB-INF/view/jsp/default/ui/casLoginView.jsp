<jsp:directive.include file="includes/top.jsp" />
<%@ page pageEncoding="UTF-8" %>
<div id="bienvenue">
<h1>Bienvenue sur le service d'authentification de l'Université de Lille Sciences et Technologies</h1>
<p>Vous souhaitez accéder à un service qui nécessite une authentification. Entrez votre identifiant Lille1 (en minuscules) et votre mot de passe puis cliquez sur le bouton "Connexion" pour continuer.</p>
</div>

<c:if test="${not pageContext.request.secure}">
    <div id="msg" class="errors">
        <h2><spring:message code="screen.nonsecure.title" /></h2>
        <p><spring:message code="screen.nonsecure.message" /></p>
    </div>
</c:if>

<div id="cookiesDisabled" class="errors" style="display:none;">
    <h2><spring:message code="screen.cookies.disabled.title" /></h2>
    <p><spring:message code="screen.cookies.disabled.message" /></p>
</div>



<div id="colonne_droite">
  <div id="zone_formulaire">
    <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
      <div>
	  <form:errors path="*" id="status" cssClass="errors" element="div" htmlEscape="false" />

	  

	  
	      <label for="username"><spring:message code="screen.welcome.label.netid" /></label>
	      <c:choose>
		  <c:when test="${not empty sessionScope.openIdLocalId}">
		      <strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
		      <input type="hidden" id="username" name="username" value="<c:out value="${sessionScope.openIdLocalId}" />" />
		  </c:when>
		  <c:otherwise>
		      <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
		      <form:input cssClass="required bordure" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true" />
		  </c:otherwise>
	      </c:choose>
<br />
	      <label for="password"><spring:message code="screen.welcome.label.password" /></label>
		  <%--
		  NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
		  "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
		  information, see the following web page:
		  http://www.technofundo.com/tech/web/ie_autocomplete.html
		  --%>
	      <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
	      <form:password cssClass="required bordure" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
	      <span id="capslock-on" style="display:none;"><p><img src="images/warning.png" valign="top"> <spring:message code="screen.capslock.on" /></p></span>


	  <!--
	  <section class="row check">
	      <p>
		  <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
		  <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
		  <br/>
		  <input id="publicWorkstation" name="publicWorkstation" value="false" tabindex="4" type="checkbox" />
		  <label for="publicWorkstation"><spring:message code="screen.welcome.label.publicstation" /></label>
		  <br/>
		  <input type="checkbox" name="rememberMe" id="rememberMe" value="true" tabindex="5"  />
		  <label for="rememberMe"><spring:message code="screen.rememberme.checkbox.title" /></label>
	      </p>
	  </section>
	  -->


	      <input type="hidden" name="lt" value="${loginTicket}" />
	      <input type="hidden" name="execution" value="${flowExecutionKey}" />
	      <input type="hidden" name="_eventId" value="submit" />

	      <input class="envoi" name="submit" accesskey="l" value="Connexion" tabindex="6" type="submit" />
	      

        </div>
    </form:form>
   
  </div>
<div id="zone_probleme">
<h2> Vous avez un problème ?</h2>
<p>
Cliquez sur
<a href="https://sesame.univ-lille1.fr/index.html">SESAME</a>
pour le résoudre.
</p>
<h2>Services numériques :</h2>
<p>
<a href="http://cri.univ-lille1.fr/Services-proposes/Etat-des-services">Calendrier</a>
des interventions et état des services
</p>
</div> 
  
  </div>


<jsp:directive.include file="includes/bottom.jsp" />
