var url = location.href;
var params = url.indexOf( "tabIndx" ) > 0?url.substring( url.indexOf( "tabIndx" ) ):"=0";
var slctdIndx =  parseInt( params.substring( params.indexOf( "=" )+1 ) );

document.links[ slctdIndx ].style.backgroundColor = "beige";

var previews = document.querySelectorAll( ".preview" );
var largeImage = document.querySelector( "#largeImage" );
for( var i=0; i<previews.length; i++ ) {
    previews[i].onclick = function() {
        largeImage.src = this.src;
    }
}
        
