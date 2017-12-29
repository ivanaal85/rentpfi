{% include"/_System/Includes/global-variables.inc" %} 
{% include"/_System/Includes/regions.inc" %} 
{module_webapps collection="propertyLogoWebapp" render="collection" id="Logo Slider {{region}}" filter="all" template=""}
		{% for item in propertyLogoWebapp.items %}
          <li>
          <div class="small-12 left">
            {% if item.['Property'] != '' -%}
             {module_webapps collection="myPropertyInfoWebapp" render="collection" id="Property Info {{region}}"  filter="item" itemId="{{item.['Property_id']}}" template=""}
             {% for item in myPropertyInfoWebapp.items %}
              <figure><a href="{{item.url}}">
              {% endfor -%}
              {% else %}
              <figure><a href="{{item.['URL']}}">
              {% endif -%}              
              <img src="{{item.['Green Logo']}}"></a></figure>
          </div>
        </li>   
        {% endfor -%}