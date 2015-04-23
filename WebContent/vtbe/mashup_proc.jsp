<%@ page import="blackboard.platform.plugin.PlugInUtil"%>
<%
//this prepares the embed HTML and inserts it into the VTBE/WYSIWYG editor
String WYSIWYG_WEBAPP = "/webapps/wysiwyg";
String title = request.getParameter("title");
String dataUrl = request.getParameter("data-url");
String output = "<p class='includeGCContent' data-url='" + dataUrl + "'>" + title + "</p><br/>"; 

request.setAttribute( "embedHtml", output );
String embedUrl = PlugInUtil.getInsertToVtbePostUrl().replace( WYSIWYG_WEBAPP, "" );
RequestDispatcher rd = getServletContext().getContext( WYSIWYG_WEBAPP ).getRequestDispatcher( embedUrl );
rd.forward( request, response );
        
%>