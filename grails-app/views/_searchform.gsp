<%@page import="com.vionto.vithesaurus.*" %>
<%@page import="com.vionto.vithesaurus.tools.*" %>
<div id="search">

  <%-- move the logo/search block a bit to the left, looks like as if it is better centered: --%>
  <div style="margin-right: 30px;">
    
  <g:if test="${homepage}">
    <div class="logo"><img
        src="${createLinkTo(dir:'images',file:message(code:'logo'))}"
        alt="${message(code:'logo.alt.text')}" width="341" height="93" /></div>
  </g:if>
  <g:else>
    <div class="logo"><a href="/"><img
        src="${createLinkTo(dir:'images',file:message(code:'logo'))}"
        alt="${message(code:'logo.alt.text')}" width="341" height="93" /></a></div>
  </g:else>

  <p class="claim"><g:message code="homepage.claim"/></p>
  <p class="mobileClaim"><a href="/"><g:message code="homepage.claim.mobile"/></a></p>

  <form style="position: relative" action="/synonyme" onsubmit="window.location='/synonyme/' + encodeURIComponent(document.searchform.q.value.replace('/', '___'));return false;" name="searchform">

    <g:set var="directSearchAttributes" value='onkeyup=\"return doSearchOnKeyUp(event);\" autocomplete=\"off\"'/>
    <span id="spinner">
      <img src="${createLinkTo(dir:'images',file:'spinner-big.gif')}" width="32" height="32" alt="Loading" />
    </span>

    <g:set var="autofocus" value=''/>
    <g:if test="${homepage && preventSearchFocus != 'true'}">
        <g:set var="autofocus" value='autofocus'/>
    </g:if>
    <g:if test="${params && params.q}">
      <input ${autofocus} ${directSearchAttributes} style="outline: none" onclick="selectSearchField()" onblur="leaveSearchField()" accesskey="s" type="text" id="search-field" name="q" value="${StringTools.slashUnescape(params.q.encodeAsHTML())}" /><input style="border-width:0px" type="image" title="${message(code:'homepage.search.button.title')}" src="${createLinkTo(dir:'images',file:'search-submit.png')}" />
    </g:if>
    <g:else>
      <input ${autofocus} ${directSearchAttributes} style="outline: none" onclick="selectSearchField()" onblur="leaveSearchField()" accesskey="s" type="text" id="search-field" name="q" placeholder="${message(code:'homepage.search.default.term')}" /><input style="border-width:0px" type="image" title="${message(code:'homepage.search.button.title')}" src="${createLinkTo(dir:'images',file:'search-submit.png')}" />
    </g:else>

<!--
    <g:if test="${request.forwardURI.toLowerCase().endsWith('/index2')}">
    </g:if>
    <g:else>
      <div class="desktopOnly">
        <a style="font-weight: normal" href="/home/index2">Neue Suche testen</a>
      </div>
    </g:else>
-->
    
    <div style="background-color: #046CCB; text-align: center; margin-left: 78px; padding: 5px;">
      <a style="color: white" href="https://languagetool.org/job/sea">Job: SEA-Manager (m/w/d)</a>
    </div>

  </form>

  </div>
    
</div>

<g:if test="${request.forwardURI.toLowerCase().endsWith('/index2')}">
  <div style="text-align: center">
    Diese neue Suche öffnet beim Tippen kein Pop-up mit einer Vorschau, sondern<br>
    direkt das Suchergebnis.
    <script type="text/javascript">
        <!--
        var firstPart = "<g:message code="footer.email.beforeAt"/>";
        var lastPart = "<g:message code="footer.email.afterAt"/>";
        document.write("<a href='mail" + "to:" + firstPart + "@" + lastPart + "'>Schreibt uns,<" + "/a>");
        // -->
    </script>
    wie Euch diese Suche gefällt! (<a href="/">alte Suche</a>)
  </div>
</g:if>


<g:if test="${preventSearchFocus != 'true'}">
    <script type="text/javascript">
    <!--
    $( document ).ready(function() {
        var touchOS = ('ontouchstart' in document.documentElement) ? true : false;
        if (!touchOS) {
          document.searchform.q.focus();
          document.searchform.q.select();
        }
        var observer = new MutationObserver(function(mutations) {
          for (x = 0; x < mutations.length; x++) {
            if (!mutations[x].addedNodes) {
              return;
            }
            try {
                var cmpwarning = document.querySelectorAll('[class*="sp_choice"]')[1];
                cmpwarning.addEventListener('click', () => {
                    console.log("cmp click event");
                    // CMP popup would steal the focus, so set it again:
                    setTimeout(() => document.searchform.q.focus(), 50);
                    if (typeof(_paq) !== 'undefined') {  // Matomo tracking
                        _paq.push(['trackEvent', "CmpClickEvent"]);
                    }
                  }
                );
                console.log("observer disconnect");
                observer.disconnect();
                break;
            } catch(e) {
              //console.log("cmpwarning event handler not set:", e);
            } 
          }
        })
        observer.observe(document.body, {
            childList: true, subtree: true, attributes: false, characterData: false
        });
    });
    // -->
    </script>
</g:if>
