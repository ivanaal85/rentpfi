{% include"/_System/Includes/regions.inc" %}     
<!--Recent prop section, home page dev copy-->
        {% comment -%}<!-------Call {{region}} Listings Web App All Items, 6 Per Page, Sortby Date------>{% endcomment -%}
        {module_webapps collection="listings" render="collection" id="Apartment Listings {{region}}" filter="all" template=""}         
        {% comment -%}<!--listing for loop-------> {% endcomment -%}
        {% for listing in listings.items | limit:12 %}

        {% comment -%}<!----------------Call Property Web App------------------> {% endcomment -%}
        {module_webapps collection="listingProp" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['property_id']}}" template=""}
        {% comment -%}<!-----------------Call Floor Plans Web App---------------------------->{% endcomment -%} 
        {module_webapps id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['floor plans_id']}}" collection="floorPlans" render="collection" template=""}

        {% comment -%}<!--Start for loops to use above web app items multiple times on page-->{% endcomment -%}
        {% for property in listingProp.items %} 
        {% for floorplan in floorPlans.items %}

        {% comment -%}<!--------------Assign listing image variables--------------->{% endcomment -%}
    {% if listing.['use alternate default listing image if available'] == "Floor Plan" -%}

        {% if floorplan.['3d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
            {% assign class = '' -%} 
            {% elseif floorplan.['2d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
            {% assign class = '' -%} 

            {% elseif floorplan.['3d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
            {% assign class = 'class="non-square-recent"' -%}
            {% elseif floorplan.['2d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
            {% assign class = 'class="non-square-recent"' -%}
        {% endif -%}

    {% elseif listing.['use alternate default listing image if available'] == "Property Square Image" -%}

        {% if property.['default square image'] !='' -%}
            {% assign defaultListingImage = {{property.['default square image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
            {% assign class = '' -%} 

            {% elseif property.['default slider image'] != '' -%}
            {% assign defaultListingImage = {{property.['default slider image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
            {% assign class = 'class="non-square-recent"' -%}
        {% endif -%}

    {% elseif listing.['listing image'] != '' -%}
        {% assign defaultListingImage = {{listing.['listing image']}} -%}
        {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
        {% assign class = '' -%}     
    {% elseif floorplan.['3d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
        {% assign class = '' -%}     
    {% elseif floorplan.['2d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
        {% assign class = '' -%}    
    {% elseif property.['default square image'] != '' -%}
        {% assign defaultListingImage = {{property.['default square image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
        {% assign class = '' -%}     

    {% elseif floorplan.['3d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
        {% assign class = 'class="non-square-recent"' -%}
    {% elseif floorplan.['2d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
        {% assign class = 'class="non-square-recent"' -%}
    {% elseif property.['default slider image'] != '' -%}
        {% assign defaultListingImage = {{property.['default slider image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=584&Height=271&algorithim=fill" -%}
        {% assign class = 'class="non-square-recent"' -%}
    {% else -%}
        {% assign defaultListingImage = "/_assets/img/PhotoComingSoon-ListingImage.jpg" -%}
        {% assign fill = "?Action=thumbnail&Width=292&Height=271&algorithim=fill_proportional" -%}
        {% assign class = 'class="default-recent-img"' -%}
    {% endif -%}
{% comment -%}<!--end variable definitions for listing image------>{% endcomment -%}    
          <li> 
            <div class="medium-12 left recent_group">
              <div class="recent-pro-block">
                <div class="large-6 medium-12 left">
                  <figure class="recent-overlay"> 
                      <a href="{{listing.['url']}}"><img {{class}} src="{{defaultListingImage}}{{fill}}"></a>
                      
                    <div class="overlay-block">
                      <h6>{{listing.['property type']}}</h6>
                      <div class="recent_facility">
                        <div class="pro_sqfoot"><span><img src="/_assets/img/sqr-foot-icon.png">{{listing.['square foot area'] | remove: ".00" }} Sq. Feet</span></div>
                        <div class="pro_bedroom"><span><img src="/_assets/img/bedroom-icon.png">{{listing.['bedrooms'] | number: "N0"}}</span></div>
                        <div class="pro_bathtub"><span><img src="/_assets/img/bathtub-icon.png">{{listing.['bathrooms'] | number: "N0"}}</span></div>
                      </div>
                    </div>
                  </figure>
                </div>
                <div class="large-6 medium-12 right">
                  <div class="recent-pro-desc">
                    <h5><a href="{{listing.['url']}}">{{listing.['listing title']}}</a></h5>
                    <p>{{listing.['small description'] | truncatewords: 20}}</p>
                  </div>
                  <div class="properti-footer">
                    <div class="pro_manth"><span>{{listing.['price'] | number: "C0"}}</span></div>
                    <div class="pro_btn"><a href="{{listing.['url']}}" class="button secondary">More Details</a></div>
                  </div>
                </div>
              </div>
            </div>
          </li>
        {% endfor -%}
        {% endfor -%}
        {% comment -%}<!--end property and floorplan for loops-->{% endcomment -%}
        {% endfor -%}
        {% comment -%}<!--end listing for loop-->{% endcomment -%}