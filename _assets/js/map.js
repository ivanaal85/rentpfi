var myCenter=new google.maps.LatLng(38.066454,-122.541058,26);
function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:10,
  scrollwheel: false,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  title:"Hello World!"
  });

var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h3 id="firstHeading" class="firstHeading">Apartment Homes Marin | PFI</h3>'+
      '<div id="bodyContent">'+
      '<p>350 Ignacio Blvd., Novato, CA 94949</p>'+
      '</div>'+
      '</div>';

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });
    var marker=new google.maps.Marker({
      position:myCenter,
        map: map,
      title:"Hello World!"
      });

  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });    
    
    
    
marker.setMap(map);

}

google.maps.event.addDomListener(window, 'load', initialize);