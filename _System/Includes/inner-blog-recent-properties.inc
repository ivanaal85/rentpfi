<div class="popular-posts">
              <ul>
            {% comment -%}<!------------------------Call {{region}} Listings Web App This Item------------------------------------------->{% endcomment -%}
                {module_webapps collection="listings" render="collection" id="Apartment Listings {{region}}" filter="all" template=""} 
                {% comment -%}<!--listing for loop-------> {% endcomment -%}
                {% for listing in listings.items | limit:3 %}

                {% comment -%}<!------------------------Call Property Web App-------------------------------------------> {% endcomment -%}
                {module_webapps collection="listingProp" render="collection" id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['property_id']}}" template=""}
                {% comment -%}<!------------------------Call Floor Plans Web App------------------------------------------->{% endcomment -%} 
                {module_webapps id="Apartment Listings {{region}}" filter="item" itemID="{{listing.['floor plans_id']}}" collection="floorPlans" render="collection" template=""}

                {% comment -%}<!--Start for loops to use above web app items multiple times on page-->{% endcomment -%}
                {% for property in listingProp.items %} 
                {% for floorplan in floorPlans.items %}

                {% comment -%}<!-------------------Assign listing image variables-------------------------------------------------->{% endcomment -%}
                {% if listing.['use alternate default listing image if available'] == "Floor Plan" -%}

                        {% if floorplan.['3d floor plan square'] != '' -%}
                            {% assign defaultListingImage = {{floorplan.['3d floor plan square']}} -%}
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                            {% assign class = '' -%} 
                              
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
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                            {% assign class = '' -%}
                              
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
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill" -%}
                            {% assign class = 'class = "non-square-listing"' -%}
                              
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
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill" -%}
                            {% assign class = 'class = "non-square-listing"' -%}
                              
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
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                            {% assign class = '' -%}
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

                            {% elseif property.['default slider image'] !='' -%}
                            {% assign defaultListingImage = {{property.['default slider image']}} -%}
                            {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill" -%}
                            {% assign class = 'class = "non-square-listing"' -%}
                  
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
                        {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                        {% assign class = '' -%}
                      
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
                        {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                        {% assign class = '' -%}
                  
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
                        {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                        {% assign class = '' -%}
                  
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
                        {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                        {% assign class = '' -%}
                          
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
                        {% assign fill = "?Action=thumbnail&Width=115&Height=68&algorithim=fill" -%}
                        {% assign class = 'class = "non-square-listing"' -%}
                          
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
                        {% assign fill = "?Action=thumbnail&Width=115&Height=68&algorithim=fill" -%}
                        {% assign class = 'class = "non-square-listing"' -%}
                  
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
                        {% assign fill = "?Action=thumbnail&Width=115&Height=68&algorithim=fill" -%}
                        {% assign class = 'class = "non-square-listing"' -%}
                  
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
                        {% assign class ='class="no-image"' -%}
                        {% assign fill = "?Action=thumbnail&Width=73&Height=68&algorithim=fill_proportional" -%}
                        {% assign listingAlt = 'photo coming soon' -%}
                        {% assign listingTitle = 'Photo Coming Soon' -%}
                        {% assign listingCap = 'Photo Coming Soon'-%}
                  
                {% endif -%}
                {% comment -%}<!--end variable definitions for listing image------>{% endcomment -%}
                <li>
                  <div class="popular-img"> 
                      <a href="{{listing.url}}"> <img {{class}} src="{{defaultListingImage}}{{fill}}" alt="{{listingAlt}}" title="{{listingTitle}}"> </a>
                    </div>
                  <div class="popular-desc">
                    <h6><a href="{{listing.url}}">{{listing.['Property Status']}}</a></h6>
                    <span>{{listing.['Listing Title']}}</span> </div>
                </li>
                {% endfor %}
                {% endfor -%}{% comment -%}<!--end property and floor plan for loops-->{% endcomment -%}
                {% endfor -%}{% comment -%}<!--end listing for loop-->{% endcomment -%} 
              </ul>
            </div>