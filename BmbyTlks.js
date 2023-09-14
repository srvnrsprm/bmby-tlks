var url = location.href;
var params = url.substring( url.indexOf( "tabIndx" ) );
var slctdIndx =  parseInt( params.substring( params.indexOf( "=" )+1 ) );

//document.links[ slctdIndx ].style.backgroundColor = "rgba( 255, 165, 00, 0.5 )";
document.links[ slctdIndx ].style.backgroundColor = "beige";
//document.links[ slctdIndx ].style.opacity = 0.7;
console.log( document.links[slctdIndx] );
