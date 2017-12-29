{% include"/_System/Includes/regions.inc" %} 
{% comment -%}<!-------Call {{region}} Listings Web App All Items, 6 Per Page, Sortby Date------>{% endcomment -%}
    {module_webapps collection="listings" render="collection" id="Apartment Listings {{region}}" filter="all" template=""}
{% assign bonusCounter = 0 -%} 
        {% for listing in listings.items %}
        {% if listing.['Bonus Amount'] > 0 and listing.['Bonus Expiration Date'] > globals.site.dateNow -%}
        {% assign bonusCounter = bonusCounter | plus: 1 -%}
            {% unless {{bonusCounter}} == 0 -%}  
<li>
  <div class="featured_block">
    <div class="large-7 medium-7 small-4 left">
      <figure> 
          {% comment -%}<!------------------------Call Property Web App-------------------------------------------> {% endcomment -%}
            {module_webapps collection="listingProp" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['property_id']}}" template=""}
            {% comment -%}<!------------------------Call Floor Plans Web App------------------------------------------->{% endcomment -%} 
            {module_webapps id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['floor plans_id']}}" collection="floorPlans" render="collection" template=""}
            {% for property in listingProp.items %} 
            {% for floorplan in floorPlans.items %}

            {% comment -%}<!-------------------Assign property gallery image variables-------------------------------------------------->{% endcomment -%}
            {% if listing.['property gallery'] !='' -%}
                {% assign defaultGalleryImage = {{listing.['property gallery']}} -%}
                {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                {% assign class1 = '' -%} 

                {% elseif listing.['use alternate default property gallery image if available'] == "Floor Plan" -%}

                    {% if floorplan.['3d floor plan'] != '' -%}
                        {% assign defaultGalleryImage = {{floorplan.['3d floor plan']}} -%}
                        {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                        {% assign class1 = '' -%}   
                    {% elseif floorplan.['2d floor plan'] != '' -%}
                        {% assign defaultGalleryImage = {{floorplan.['2d floor plan']}} -%}
                        {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                        {% assign class1 = '' -%}   
                    {% elseif floorplan.['3d floor plan square'] != '' -%}
                        {% assign defaultGalleryImage = {{floorplan.['3d floor plan square']}} -%}
                        {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                        {% assign class1 = 'class = "default-gallery-img1"' -%}
                    {% elseif floorplan.['2d floor plan square'] != '' -%}
                        {% assign defaultGalleryImage = {{floorplan.['2d floor plan square']}} -%}
                        {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                        {% assign class1 = 'class = "default-gallery-img1"' -%}
                    {% endif -%}

                {% elseif listing.['use alternate default property gallery image if available'] == "Default Slider Image" -%}

                    {% if property.['default slider image'] !='' -%}
                    {% assign defaultGalleryImage = {{property.['default slider image']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                    {% assign class1 = '' -%}   
                    {% elseif property.['default square image'] != '' -%}
                    {% assign defaultGalleryImage = {{property.['default square image']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                    {% assign class1 = 'class = "default-gallery-img1"' -%}
                    {% endif -%}

                {% elseif floorplan.['3d floor plan'] != '' -%}
                    {% assign defaultGalleryImage = {{floorplan.['3d floor plan']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                    {% assign class1 = '' -%}   
                {% elseif floorplan.['2d floor plan'] != '' -%}
                    {% assign defaultGalleryImage = {{floorplan.['2d floor plan']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                    {% assign class1 = '' -%}   
                {% elseif property.['default slider image'] != '' -%}
                    {% assign defaultGalleryImage = {{property.['default slider image']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                    {% assign class1 = '' -%}   
                {% elseif floorplan.['3d floor plan square'] != '' -%}
                    {% assign defaultGalleryImage = {{floorplan.['3d floor plan square']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                    {% assign class1 = 'class = "default-gallery-img1"' -%}
                {% elseif floorplan.['2d floor plan square'] != '' -%}
                    {% assign defaultGalleryImage = {{floorplan.['2d floor plan square']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                    {% assign class1 = 'class = "default-gallery-img1"' -%}
                {% elseif property.['default square image'] != '' -%}
                    {% assign defaultGalleryImage = {{property.['default square image']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                    {% assign class1 = 'class = "default-gallery-img1"' -%}
                {% elseif listing.['listing image'] != '' -%}
                    {% assign defaultGalleryImage = {{listing.['listing image']}} -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill" -%}
                    {% assign class1 = 'class = "default-gallery-img1"' -%}

                {% else -%}
                    {% assign defaultGalleryImage = "/_assets/img/PhotoComingSoon-PropertyGallery-LeftAligned.jpg" -%}
                    {% assign fill = "?Action=thumbnail&Width=641&Height=390&algorithim=fill_proportional" -%}
                    {% assign class1 = '' -%}   

            {% endif -%}

{% comment -%}<!-------------------End Assign property gallery image variables-------------------------->{% endcomment -%}

          <a href="{{listing.['url']}}"><img {{class1}} src="{{defaultGalleryImage}}{{fill}}"></a>

{% endfor -%}
{% endfor -%}
{% comment -%}<!--end floor plan and property for loops-->{% endcomment -%}

        <div class="featured_overlay">
          <h2>{{listing.['property type']}}</h2>
            {% if listing.['bonus description'] != '' %}
          <h4>{{listing.['bonus description']}}</h4>
            {% else %}
          <h4>{{listing.['bonus amount'] | number: "C0"}} Bonus!</h4>	
            {% endif -%}
          <p>{{listing.['price'] | number: "C0"}}/mo.</p>
        </div>
      </figure>
    </div>
    <div class="large-5 medium-5 small-6 right property-block-right">
      <div class="featured-desc">
        <h3><a href="{{listing.['url']}}">{{listing.['listing title']}}</a></h3>
        <p>{{listing.['small description']}}</p>
        <div class="property_facility">
          <div class="pro_sqfoot"><span><img src="/_assets/img/sqr-foot-icon1.png">{{listing.['square foot area'] | number: "N0"}} sqft</span></div>
          <div class="pro_bedroom"><span><img src="/_assets/img/bedroom-icon1.png">{{listing.['bedrooms'] | number: "N0"}}</span></div>
          <div class="pro_bathtub"><span><img src="/_assets/img/bathtub-icon1.png">{{listing.['bathrooms'] | number: "N0"}}</span></div>
        </div>
      </div>
      <div class="properti-footer">
        <div class="pro_btn"><a href="{{listing.['url']}}" class="button secondary">More Details</a></div>
      </div>
    </div>
  </div>
</li>
{% endunless -%}
{% endif -%}
{% endfor -%}