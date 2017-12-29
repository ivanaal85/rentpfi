{module_webapps id="Property Listings" filter="all" collection="myWebapp1" render="collection" template=""}
         {% for item in myWebapp1.items %}
         <li>
          <div class="featured_block">
            <div class="large-7 medium-7 small-4 left">
              <figure> <a href="{{item1.['url']}}"><img src="{{item1.['property gallery']}}"></a>
                <div class="featured_overlay">
                  <h2>{{item1.['property type']}}</h2>
                  <h4>{{item1.['bonus description']}}</h4>
                  <p>{{item1.['price'] | number: "C0"}}/mo.</p>
                </div>
              </figure>
            </div>
              <div class="large-5 medium-5 small-6 right property-block-right">
              <div class="featured-desc">
                <h3><a href="{{item1.['url']}}">{{item1.['listing title']}}</a></h3>
                <p>{{item1.['small description']}}</p>
                <div class="property_facility">
                	<div class="pro_sqfoot"><span><img src="_assets/img/sqr-foot-icon1.png">{{item1.['square foot area'] | number: "N0"}} sqft</span></div>
                	<div class="pro_bedroom"><span><img src="_assets/img/bedroom-icon1.png">{{item1.['bedrooms'] | number: "N0"}}</span></div>
                	<div class="pro_bathtub"><span><img src="_assets/img/bathtub-icon1.png">{{item1.['bathrooms'] | number: "N0"}}</span></div>
              </div>
              </div>
       
              <div class="properti-footer">
           
                <div class="pro_btn"><a href="{{item1.['url']}}" class="button secondary">More Details</a></div>
              </div>
            </div>
          </div>
        </li>
       
        {% endfor %}