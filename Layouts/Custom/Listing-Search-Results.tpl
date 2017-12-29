{% include"/_System/Includes/regions.inc" %} 
{% comment -%}<!------------------------Call {{region}} Listings Web App This Item------------------------------------------->
<!--This layout is used for listing search results-->
{% endcomment -%}
{module_webapps collection="listings" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{tag_itemid}" template=""} 
    {% comment -%}<!--listing for loop-------> {% endcomment -%}
    {% for listing in listings.items %}

    {% comment -%}<!----------------Call Property Web App------------------> {% endcomment -%}
    {module_webapps collection="listingProp" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['property_id']}}" template=""}
    {% comment -%}<!-----------------Call Floor Plans Web App---------------------------->{% endcomment -%} 
    {module_webapps id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['floor plans_id']}}" collection="floorPlans" render="collection" template=""}

    {% comment -%}<!--Start for loops to use above web app items multiple times on page-->{% endcomment -%}
    {% for property in listingProp.items %} 
    {% capture propertyName -%}{{property.name}}{%endcapture-%}
    {% for floorplan in floorPlans.items %}

    {% comment -%}<!--------------Assign listing image variables--------------->{% endcomment -%}
    {% if listing.['use alternate default listing image if available'] == "Floor Plan" -%}

        {% if floorplan.['3d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}
            {% elseif floorplan.['2d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}

            {% elseif floorplan.['3d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="listing-page"' -%}
            {% assign class = 'class="non-square-search-result"' -%}
            {% elseif floorplan.['2d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="listing-page"' -%}
            {% assign class = 'class="non-square-search-result"' -%}
        {% endif -%}

    {% elseif listing.['use alternate default listing image if available'] == "Property Square Image" -%}

        {% if property.['default square image'] !='' -%}
            {% assign defaultListingImage = {{property.['default square image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}

            {% elseif property.['default slider image'] != '' -%}
            {% assign defaultListingImage = {{property.['default slider image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="non-square-search-result"' -%}
        {% endif -%}

    {% elseif listing.['listing image'] != '' -%}
        {% assign defaultListingImage = {{listing.['listing image']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}
    {% elseif floorplan.['3d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}
    {% elseif floorplan.['2d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}
    {% elseif property.['default square image'] != '' -%}
        {% assign defaultListingImage = {{property.['default square image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}

    {% elseif floorplan.['3d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}
    {% elseif floorplan.['2d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}
    {% elseif property.['default slider image'] != '' -%}
        {% assign defaultListingImage = {{property.['default slider image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}
    {% else -%}
        {% assign defaultListingImage = "/_assets/img/PhotoComingSoon-ListingImage.jpg" -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="default-recent-img"' -%}
    {% endif -%}
{% comment -%}<!--end variable definitions for listing image------>{% endcomment -%}  
<div class="medium-12 columns">
    <div class="properti-block reduced{tag_price reduced}">
        <div class="large-5 medium-11 small-12 left">
            <div class="properti-image">
                <figure class="view-overlay"> 
                    <a href="{{listing.['url']}}"><img {{class}} data-mh="featured-prop" src="{{defaultListingImage}}{{fill}}"></a>
                    <div class="triangle"><em class="fa fa-star"></em></div>
                    <div class="overlay-icon"><a href="{{listing.['url']}}"><em class="fa fa-search"></em></a></div>
                </figure>
            </div>
        </div>
        <div class="large-7 medium-11 small-12 left property-block-right matchheightme" data-mh="featured-prop">
            <div class="properti-desc">
                <h4><a href="{{listing.['url']}}">{{listing.['listing title']}}</a></h4>
                <h5>{{propertyName}}</h5>
                <p>{{listing.['small description']  | truncatewords: 25, '...'}}</p>
            </div>
            <div class="property_facility">
                <div class="pro_sqfoot"><span><img src="/_assets/img/sqr-foot-icon1.png">{{listing.['square foot area'] | remove: ".00" }} Sqft</span></div>
                <div class="pro_bedroom"><span><img src="/_assets/img/bedroom-icon1.png">{{listing.['bedrooms'] | number: "N0"}}</span></div>
                <div class="pro_bathtub"><span><img src="/_assets/img/bathtub-icon1.png">{{listing.['bathrooms'] | number: "N0"}}</span></div>
            </div>
            <div class="properti-footer">
                <div class="pro_manth"><span>{{listing.['price'] | number: "C0"}}</span></div>
                <div class="pro_btn"><a href="{tag_itemurl_nolink}" class="button secondary">More Details</a></div>
            </div>
        </div>
    </div>
</div>
{% endfor -%}
{% endfor -%}
{% comment -%}<!--end property and floorplan for loops-->{% endcomment -%}
{% endfor -%}
{% comment -%}<!--end listing for loop-->{% endcomment -%}