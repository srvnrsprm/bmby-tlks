<html>
  <head>
    <title>Bombay Talkies</title>
    <meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="styles.css" /> 
    </head>
    <body style="background-color:beige;" width="100%:">
		<div style="float:right;background-color: tan;color: white;" id="notifyBox"></div>
    <div align="center" style="background-color: orangered;"><img src="assets/bg.jpeg" height="70px"></img></div>
	  <div id="menu-bar">
      <ul>
        <li>
          <a href="index.jsp?tabIndx=0">
              <span>About us</span>
          </a>
        </li>
        <li>
          <a href="index.jsp?tabIndx=1">
              <span>Movies screening</span>
          </a>
        </li>
        <li>
          <a href="index.jsp?tabIndx=2">
              <span>Contact Us</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="container">
      <% String index = request.getParameter( "tabIndx" );
         int indx=(index==null)?0:Integer.parseInt(index);
         if( indx == 0 ) {
         %>
      <jsp:include page="home.html" />
      <% } else if( indx == 1 ) {
         %>
      <jsp:include page="rnnngMovies.html" />
      <% } else {
         %>
      <jsp:include page="cntctUs.html" />
      <% } %>  
		</div>
		<script src="domEnhncr.js"></script>
    <script src="app.js"></script>
  </body>
</html> 
