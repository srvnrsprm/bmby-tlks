<html>
  <head>
    <title>Bombay Talkies</title>
    <meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="BmbyTlks.css" /> 
  </head>
  <body style="background-color:beige;" width="100%:">
    <div align="center" style="background-color: orangered;"><img src="assets/bg.jpeg" height="70px"></img></div>
	  <div id="menu-bar">
      <ul>
        <li>
          <a href="BmbyTlks.jsp?tabIndx=0">
            <table>
              <tr><td><span class="mnu_icon" id="mnu_about_us" align="center"></span></td></tr>
              <tr><td>About us</td></tr>
            </table>
          </a>
        </li>
        <li>
          <a href="BmbyTlks.jsp?tabIndx=1">
            <table>
              <tr><td> <span class="mnu_icon" id="mnu_rnnng_mvs" align="center"></span></td></tr>
              <tr><td>Movies screening</td></tr>
            </table>
          </a>
        </li>
        <li>
          <a href="BmbyTlks.jsp?tabIndx=2">
            <table>
              <tr><td> <span class="mnu_icon" id="mnu_upcmng_mvs" align="center"></span></td></tr>
              <tr><td>Upcoming movies</td></tr>
            </table>
          </a>
        </li>
      </ul>
    </div>
    <div class="container">
      <% String index = request.getParameter( "tabIndx" );
         int indx=(index==null)?0:Integer.parseInt(index);
         if( indx == 0 ) {
         %>
      <jsp:include page="BmbyTlksHome.html" />
      <% } else if( indx == 1 ) {
         %>
      <jsp:include page="BmbyTlksRnnngMovies.html" />
      <% } else {
         %>
      <jsp:include page="BmbyTlksFutureMovies.html" />
      <% } %>  
    </div> 
    <script src="BmbyTlks.js"></script>
  </body>
</html> 
