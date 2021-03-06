{% include"/_System/Includes/global-variables.inc" %} 
{% include"/_System/Includes/regions.inc" %} 

{module_webapps collection="ourManagersWebapp" render="collection" id="Our Managers {{region}}" filter="all" template=""}
{% for item in ourManagersWebapp.items %}
{% unless item.['name'] == '1 - No Current Onsite Agent' -%}
<div class="large-4 medium-6 columns">               
                <div class="ouragents-block ">
                  <div class="ouragents-image">
                      {% if item.['image'] != "" -%}
                      <figure><a href="{{item.url}}"><img src="{{item.['Image']}}?Action=thumbnail&Width=135&Height=135&algorithim=fill_proportional"></a></figure>
                      {% elseif item.['placeholder image'] == "Male" -%}
                      <figure><a href="{{item.url}}"><img src="{{defaultMaleMgrImage}}?Action=thumbnail&Width=135&Height=135&algorithim=fill_proportional"></a></figure>
                      {% elseif item.['placeholder image'] == "Female" -%}
                      <figure><a href="{{item.url}}"><img src="{{defaultFemaleMgrImage}}?Action=thumbnail&Width=135&Height=135&algorithim=fill_proportional"></a></figure>
                      {% else -%}
                      <figure><a href="{{item.url}}"><img src="{{defaultListingImage}}?Action=thumbnail&Width=135&Height=135&algorithim=fill_proportional"></a></figure>
                      {% endif -%}
                  </div>
                  <div class="ouragents-desc">
					  <h4>{{item.name}}</h4>
                      <p>{{item.['title']}}</p>
                      {{item.['Small Description']}}
                    <div class="agents-view">
                        <h4><a href="{{item.url}}">{{item.name}}</a></h4>
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        <p><a href="tel:{{item.['Phone']}}"><em class="fa fa-phone"></em>{{item.['Phone']}}</a></p>
                        {% endfor -%}
                        {% if item.['Mobile Number'] == '' -%}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Mobile Number'] != '' -%}
                        <p><a href="tel:{{item.['Mobile Number']}}"><em class="fa fa-mobile"></em>{{item.['Mobile Number']}}</a></p>
                        {% endif -%}
                        {% endfor -%}
                        {% else %}
                        <p><a href="tel:{{item.['Mobile Number']}}"><em class="fa fa-mobile"></em>{{item.['Mobile Number']}}</a></p>
                        {% endif -%}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        <p><a href="mailto:{{item.['Email']}}"><em class="fa fa-envelope"></em>{{item.['Email']}}</a></p>
                        {% if item.['Skype User Name'] != '' -%}
                        <p><a href="#"><em class="fa fa-skype"></em>{{item.['Skype User Name']}}</a></p>
                        {% endif -%}
                        {% endfor -%} 
                    </div>
                  </div>
                  {% if item.['Twitter Link'] == '' and item.['Facebook Link'] == '' and item.['LinkedIn Link'] == '' and item.['Google-Plus Link'] == '' and item.['Rss Link'] == '' -%}
                  {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Twitter Link'] == '' and item.['Facebook Link'] == '' and item.['LinkedIn Link'] == '' and item.['Google-Plus Link'] == '' and item.['Rss Link'] == '' -%}
                  <div></div>
                  {% else %}
                  <div class="agents-footer">
                    <ul>
                        {% if item.['Twitter Link'] != '' -%}
                        <li><a href="{{item.['Twitter Link']}}"><em class="fa fa-twitter"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Twitter Link'] != '' -%}
                        <li><a href="{{item.['Twitter Link']}}"><em class="fa fa-twitter"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Facebook Link'] != '' -%}
                        <li><a href="{{item.['Facebook Link']}}"><em class="fa fa-facebook"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Facebook Link'] != '' -%}
                        <li><a href="{{item.['Facebook Link']}}"><em class="fa fa-facebook"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['LinkedIn Link'] != '' -%}
                        <li><a href="{{item.['LinkedIn Link']}}"><em class="fa fa-linkedin"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['LinkedIn Link'] != '' -%}
                        <li><a href="{{item.['LinkedIn Link']}}"><em class="fa fa-linkedin"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Google-Plus Link'] != '' -%}
                        <li><a href="{{item.['Google-Plus Link']}}"><em class="fa fa-google-plus"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Google-Plus Link'] != '' -%}
                        <li><a href="{{item.['Google-Plus Link']}}"><em class="fa fa-google-plus"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Rss Link'] != '' -%}
                        <li><a href="{{item.['Rss Link']}}"><em class="fa fa-rss"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Rss Link'] != '' -%}
                        <li><a href="{{item.['Rss Link']}}"><em class="fa fa-rss"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                    </ul>
                  </div>
                  {% endif -%}
                  {% endfor -%}
                  {% else %}
                  <div class="agents-footer">
                    <ul>
                        {% if item.['Twitter Link'] != '' -%}
                        <li><a href="{{item.['Twitter Link']}}"><em class="fa fa-twitter"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Twitter Link'] != '' -%}
                        <li><a href="{{item.['Twitter Link']}}"><em class="fa fa-twitter"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Facebook Link'] != '' -%}
                        <li><a href="{{item.['Facebook Link']}}"><em class="fa fa-facebook"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Facebook Link'] != '' -%}
                        <li><a href="{{item.['Facebook Link']}}"><em class="fa fa-facebook"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['LinkedIn Link'] != '' -%}
                        <li><a href="{{item.['LinkedIn Link']}}"><em class="fa fa-linkedin"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['LinkedIn Link'] != '' -%}
                        <li><a href="{{item.['LinkedIn Link']}}"><em class="fa fa-linkedin"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Google-Plus Link'] != '' -%}
                        <li><a href="{{item.['Google-Plus Link']}}"><em class="fa fa-google-plus"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Google-Plus Link'] != '' -%}
                        <li><a href="{{item.['Google-Plus Link']}}"><em class="fa fa-google-plus"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                        {% if item.['Rss Link'] != '' -%}
                        <li><a href="{{item.['Rss Link']}}"><em class="fa fa-rss"></em></a></li>
                        {% else %}
                        {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Leasing Office Location_id']}}" template=""}
                        {% for item in myPropertyInfoWebapp.items %}
                        {% if item.['Rss Link'] != '' -%}
                        <li><a href="{{item.['Rss Link']}}"><em class="fa fa-rss"></em></a></li>
                        {% endif -%}
                        {% endfor -%}
                        {% endif -%}
                    </ul>
                  </div>
                  {% endif -%}
                </div>
              </div>
              {% endunless -%}
              {% endfor %}
