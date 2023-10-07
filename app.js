var url = location.href;
var params = url.indexOf( "tabIndx" ) > 0?url.substring( url.indexOf( "tabIndx" ) ):"=0";
var slctdIndx =  parseInt( params.substring( params.indexOf( "=" )+1 ) );
var notifyElmnt = document.getElementById( "notifyBox" );

document.links[ slctdIndx ].style.backgroundColor = "beige";

var previews = document.querySelectorAll( ".preview" );
var largeImage = document.querySelector( "#largeImage" );
for( var i=0; i<previews.length; i++ ) {
    previews[i].onclick = function() {
        largeImage.src = this.src;
    }
}

function dltNotifyRow( elmnt, duration ) {
  if( duration ) {
    elmnt.closest( "table" ).fadeOut( duration );
  } else {
    elmnt.closest( "table" ).fadeOut( 5000 );
  }
}

function createElementFromHTML(htmlString) {
  var div = document.createElement('div');
  div.innerHTML = htmlString.trim();

  // Change this to div.childNodes to support multiple top-level nodes.
  return div.firstChild;
}

function sndMail( form ) {
		var data = {
				email: form.email.value,
				subject: form.subject.value,
				message: form.message.value
		}
		var formBody = [];
		for (var property in data) {
				var encodedKey = encodeURIComponent(property);
				var encodedValue = encodeURIComponent(data[property]);
				formBody.push(encodedKey + "=" + encodedValue);
		}
		formBody = formBody.join( "&" );
		fetch( "api/sndMl", {
				method: form.method,
				body: formBody,
				headers: new Headers({ 'content-type' : 'application/x-www-form-urlencoded' })
		}).then ( function( ) {
				var ntfyStrng = "<table><colgroup><col width=90%><col width=10%></colgroup><tr><td>Mail sent successfully</td><td onClick='dltNotifyRow(this)'>&times;</td></tr></table>";
				var doc = createElementFromHTML( ntfyStrng );
				dltNotifyRow( doc, 30000 );
				notifyElmnt.appendChild( doc );
		}, function( err ) {
				alert( "Error in processing the request, " + err );
		});
}
