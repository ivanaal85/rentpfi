{% include"/_System/Includes/regions.inc" %} 
{module_webapps collection="listings" render="collection" id="Apartment Listings {{region}}" filter="all" template=""}
{% comment -%}<!--listing for loop-------> {% endcomment -%}
{% for listing in listings.items %}
{% comment -%}<!------------------------Call Property Web App-------------------------------------------> {% endcomment -%}
{module_webapps collection="listingProp" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['property_id']}}" template=""}    
{% comment -%}<!--Start for loops to use above web app items multiple times on page-->{% endcomment -%}
{% for property in listingProp.items %} 

{% comment -%}<!--assign slider image variables-->{% endcomment -%}
    {% assign sliderImage = '' -%}   
    {% if listing.['Add to Homepage Slider'] == 'checked' and listing.['slider image'] != '' -%} 

    {% assign sliderImage = {{listing.['slider image']}} -%}

    {% elseif listing.['Add to Homepage Slider'] != 'checked' and listing.['Bonus Amount'] > 0 and listing.['Bonus Expiration Date'] > globals.site.dateNow and listing.['Slider Image'] != '' -%}

    {% assign sliderImage = {{listing.['slider image']}} -%}    

    {% elseif listing.['add to homepage slider'] == 'checked' and listing.['use default property slider image'] == 'checked' and property.['default slider image'] != '' -%} 

    {% assign sliderImage = {{property.['default slider image']}} -%} 

    {% elseif listing.['Add to Homepage Slider'] != 'checked' and listing.['Bonus Amount'] > 0 and listing.['Bonus Expiration Date'] > globals.site.dateNow and property.['default slider image'] != ''  -%}

    {% assign sliderImage = {{property.['default slider image']}} -%}

    {% endif -%}
{% comment -%}<!--end slider image variables-->{% endcomment -%}  

{% if {{sliderImage}} != '' -%}    
<li class="hero-content"> <img src="{{sliderImage}}?Action=thumbnail&Width=1903&Height=793&algorithim=fill_proportional">
      <div class="hero-caption">
        <div class="row">
          <div class="medium-12 column">
            <div class="hero-detail">
              <div class="hero-box">
                  <h5>{{listing.['Listing Title']}}</h5>
                  {% if listing.['Bonus Description'] != '' -%}
                  {% if listing.['Bonus Expiration Date'] > globals.site.dateNow  -%}
				  <p class="lead">{{ listing.['Bonus Description'] | truncatewords: 20, '...' }}!</p>
                  <p>{{ listing.['Small Description'] | truncatewords: 10, '...' }}</p>
                  {% else -%}
                  <p>{{ listing.['Small Description'] | truncatewords: 20, '...' }}</p>
                  {% endif -%}
                  {% else -%}
                  {% if listing.['Bonus Amount'] > 0 -%}
                  {% if listing.['Bonus Expiration Date'] > globals.site.dateNow  -%}
                  <p class="lead">{{ listing.['Bonus Amount'] | money | remove: '.00' }} Bonus! Click Button Below For More Details...</p>
                  <p>{{ listing.['Small Description'] | truncatewords: 20, '...' }}</p>
                  {% else -%}
                  <p>{{ listing.['Small Description'] | truncatewords: 20, '...' }}</p>
                  {% endif -%}
                  {% else -%}
                  <p>{{ listing.['Small Description'] | truncatewords: 20, '...' }}</p>
                  {% endif -%}
                  {% endif -%}
                  <h6>{{listing.['Price'] | money | remove: '.00'}}</h6> 
              </div>
              <ul>
                <li><img src="/_assets/img/sqr-foot-icon.png">
                    <h6>{{listing.['Square Foot Area'] | remove: '.00'}} Sq. Feet</h6>
                </li>
                <li><img src="/_assets/img/bedroom-icon.png">
                    <h6>{{listing.['Bedrooms'] | remove: '.00'}}</h6>
                </li>
                <li><img src="/_assets/img/bathtub-icon.png">
                    <h6>{{listing.['Bathrooms'] | remove: '.00'}}</h6>
                </li>
              </ul>
               {% if listing.['Slider Button URL'] == '' -%}
                <a class="button primary large" href="{{ listing.url }}">More Details</a> </div>
                {% else -%}
                <a class="button primary large" href="{{ listing.['Slider Button URL'] }}">More Details</a> </div>
                {% endif -%}
          </div>
        </div>
      </div>
    </li>
    {% endif -%}
    {% endfor -%}
    {% endfor -%}