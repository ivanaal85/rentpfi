{% include"/_System/Includes/regions.inc" %}
{% comment -%}<!--assign Facebook App ID Variables for regions-->{% endcomment -%}
{% if {{region}} == 'Marin' -%}
{% assign fbapp_id = "558419337825654" -%}
{% elseif {{region}} == 'Sonoma' -%}
{% assign fbapp_id = "567762963572517" -%}
{% else -%}
{% assign fbapp_id = "163420730963523" -%}
{% endif -%}
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

    {% comment -%}<!--------------Assign listing variables--------------->{% endcomment -%}
    {% if listing.['use alternate default listing image if available'] == "Floor Plan" -%}

        {% if floorplan.['3d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}

                {% if floorplan.['3d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['3d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['3d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['3d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

            {% elseif floorplan.['2d floor plan square'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}
            
                {% if floorplan.['2d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['2d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['2d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['2d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

            {% elseif floorplan.['3d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="listing-page"' -%}
            {% assign class = 'class="non-square-search-result"' -%}

                {% if floorplan.['3d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['3d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['3d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['3d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

            {% elseif floorplan.['2d floor plan'] != '' -%}
            {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="listing-page"' -%}
            {% assign class = 'class="non-square-search-result"' -%}

                {% if floorplan.['2d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['2d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['2d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['2d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

        {% endif -%}

    {% elseif listing.['use alternate default listing image if available'] == "Property Square Image" -%}

        {% if property.['default square image'] !='' -%}
            {% assign defaultListingImage = {{property.['default square image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
            {% assign class = 'class="listing-page"' -%}
            
                {% if property.['default image alt text'] != '' -%}
                    {% assign listingAlt = {{property.['default image alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if property.['default image title'] != '' -%}
                    {% assign listingTitle = {{property.['default image title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if property.['default image caption'] != '' -%}
                    {% assign listingCap = {{property.['default image caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%}

            {% elseif property.['default slider image'] != '' -%}
            {% assign defaultListingImage = {{property.['default slider image']}} -%}
            {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
            {% assign class = 'class="non-square-search-result"' -%}

                {% if property.['default image alt text'] != '' -%}
                    {% assign listingAlt = {{property.['default image alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if property.['default image title'] != '' -%}
                    {% assign listingTitle = {{property.['default image title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if property.['default image caption'] != '' -%}
                    {% assign listingCap = {{property.['default image caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%}
        {% endif -%}

    {% elseif listing.['listing image'] != '' -%}
        {% assign defaultListingImage = {{listing.['listing image']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}

            {% if listing.['listing image alt text'] != '' -%}
                {% assign listingAlt = {{listing.['listing image alt text']}} -%}
            {% else -%}
                {% assign listingAlt = '' -%}
            {% endif -%}
            {% if listing.['listing image title'] != '' -%}
                {% assign listingTitle = {{listing.['listing image title']}} -%}
            {% else -%}
                {% assign listingTitle = '' -%}
            {% endif -%}
            {% if listing.['listing image caption'] != '' -%}
                {% assign listingCap = {{listing.['listing image caption']}} -%}
            {% else -%}
                    {% assign listingCap = '' -%}
            {% endif -%}

    {% elseif floorplan.['3d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}

            {% if floorplan.['3d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['3d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['3d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['3d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

    {% elseif floorplan.['2d floor plan square'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan square']}} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}

            {% if floorplan.['2d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['2d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['2d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['2d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

    {% elseif property.['default square image'] != '' -%}
        {% assign defaultListingImage = {{property.['default square image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="listing-page"' -%}

            {% if property.['default image alt text'] != '' -%}
                    {% assign listingAlt = {{property.['default image alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if property.['default image title'] != '' -%}
                    {% assign listingTitle = {{property.['default image title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if property.['default image caption'] != '' -%}
                    {% assign listingCap = {{property.['default image caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%}

    {% elseif floorplan.['3d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['3d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}
            
            {% if floorplan.['3d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['3d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['3d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['3d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['3d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

    {% elseif floorplan.['2d floor plan'] != '' -%}
        {% assign defaultListingImage = {{floorplan.['2d floor plan']}} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}

            {% if floorplan.['2d floor plan alt text'] != '' -%}
                    {% assign listingAlt = {{floorplan.['2d floor plan alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan title'] != '' -%}
                    {% assign listingTitle = {{floorplan.['2d floor plan title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if floorplan.['2d floor plan caption'] != '' -%}
                    {% assign listingCap = {{floorplan.['2d floor plan caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%} 

    {% elseif property.['default slider image'] != '' -%}
        {% assign defaultListingImage = {{property.['default slider image'] }} -%}
        {% assign fill = "?Action=thumbnail&Width=550&Height=279&algorithim=fill" -%}
        {% assign class = 'class="non-square-search-result"' -%}

            {% if property.['default image alt text'] != '' -%}
                    {% assign listingAlt = {{property.['default image alt text']}} -%}
                {% else -%}
                    {% assign listingAlt = '' -%}
                {% endif -%}
                {% if property.['default image title'] != '' -%}
                    {% assign listingTitle = {{property.['default image title']}} -%}
                {% else -%}
                    {% assign listingTitle = '' -%}
                {% endif -%}
                {% if property.['default image caption'] != '' -%}
                    {% assign listingCap = {{property.['default image caption']}} -%}
                {% else -%}
                    {% assign listingCap = '' -%}
                {% endif -%}
    {% else -%}
        {% assign defaultListingImage = "/_assets/img/PhotoComingSoon-ListingImage.jpg" -%}
        {% assign fill = "?Action=thumbnail&Width=296&Height=279&algorithim=fill_proportional" -%}
        {% assign class = 'class="default-recent-img"' -%}
        {% assign listingAlt = 'photo coming soon' -%}
        {% assign listingTitle = 'Photo Coming Soon' -%}
        {% assign listingCap = 'Photo Coming Soon'-%}
    {% endif -%}

{% comment -%}<!--------------Assign listing description variables--------------->{% endcomment -%}
{% if listing.['use property small description'] == "checked" -%}
        {% assign listingSmallDescription = {{property.['small description']}} -%}
    {% else -%}
        {% assign listingSmallDescription = {{listing.['small description']}} -%}
{% endif -%}
{% if listing.['use property regular description'] == "checked" -%}
        {% assign listingRegularDescription = {{property.description}} -%}
    {% else -%}
        {% assign listingRegularDescription = {{listing.description']}} -%}
{% endif -%}

{% comment -%}<!--end variable definitions for listing------>{% endcomment -%} 
{% comment -%}<!--facebook share buttons-->{% endcomment -%}    
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{{fbapp_id}}',
      xfbml      : true,
      version    : 'v2.11'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<div class="medium-12 columns">
    <div class="properti-block reduced{tag_price reduced}">
        <div class="large-5 medium-11 small-12 left">
            <div class="properti-image">
                <figure class="view-overlay"> 
                    <a href="{{listing.['url']}}"><img {{class}} data-mh="featured-prop" src="{{defaultListingImage}}{{fill}}" alt="{{listingAlt}}" title="{{listingTitle}}"></a>
                    <div class="triangle"><em class="fa fa-star"></em></div>
                    <div class="overlay-icon"><a href="{{listing.['url']}}"><em class="fa fa-search"></em></a></div>
                </figure>
            </div>
        </div>
        <div class="large-7 medium-11 small-12 left property-block-right matchheightme" data-mh="featured-prop">
            <div class="properti-desc">
                <h4><a href="{{listing.['url']}}">{{listing.['listing title']}}</a></h4>
                <h5>{{propertyName}}</h5>
                <p>{{listingSmallDescription  | truncatewords: 25, '...'}}</p>
                <span class="social-share"> <a id="{{listing.name}}" href="javascript:void(0);" title="Facebook Share"><em class="fa fa-facebook" aria-hidden="true"></em></a> <a class="customer share" href="javascript:void(0);" title="Twitter Share" onClick="PopupCenter('https://twitter.com/intent/tweet?url={module_siteUrl,true,true}{{listing.url | url_param_escape}}&hashtags={{listing.['hashtags']}}','','500','250')"><em class="fa fa-twitter" aria-hidden="true"></em></a> <a class="customer share" href="javascript:void(0);" target="_blank" onClick="PopupCenter('https://www.linkedin.com/shareArticle?mini=true&url=http://{module_siteUrl}{{listing.url}}')" title="Linkedin Share"><em class="fa fa-linkedin" aria-hidden="true"></em></a> <a href="mailto:?subject=I wanted you to see this apartment for rent - {{listing.['listing title']}}&amp;body=Check out this apartment for rent http://{module_siteUrl}{{listing.url}}" title="Email Share"><em class="fa fa-envelope" aria-hidden="true"></em></a>
                {tag_addtofavorites,<img alt="favorites icon" title="Add to Favorites" src="/_assets/img/favorites-icon.png" />,<img alt="favorites icon" title="Remove from Favorites" src="/_assets/img/remove-favorites-icon.png" />}    
                <script>
                var randomID = Math.floor(Math.random() * 1000000000001);
                document.getElementById('{{listing.name}}').setAttribute('id', randomID);
                document.getElementById(randomID).onclick = function() {
                  FB.ui({
                    method: 'share',
                    display: 'popup',
                    href: '{module_siteUrl}{{listing.url}}',
                  }, function(response){});
                }


                function PopupCenter(url, title, w, h) {
                    // Fixes dual-screen position                         Most browsers      Firefox
                    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
                    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

                    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
                    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

                    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
                    var top = ((height / 2) - (h / 2)) + dualScreenTop;
                    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

                    // Puts focus on the newWindow
                    if (window.focus) {
                        newWindow.focus();
                    }
                }
                    </script> 
                </span>
            </div>
            <div class="property_facility">
                <div class="pro_sqfoot"><span><img src="/_assets/img/sqr-foot-icon1.png" alt="square footage icon" title="Square Footage">{{listing.['square foot area'] | remove: ".00" }} Sqft</span></div>
                <div class="pro_bedroom"><span><img src="/_assets/img/bedroom-icon1.png" alt="bedrooms icon" title="Bedrooms">{{listing.['bedrooms'] | number: "N0"}}</span></div>
                <div class="pro_bathtub"><span><img src="/_assets/img/bathtub-icon1.png" alt="bathrooms icon" title="Bathrooms">{{listing.['bathrooms'] | number: "N0"}}</span></div>
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