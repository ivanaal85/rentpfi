{module_webapps collection="testimonialWebapp" render="collection" id="Testimonials" filter="all" template=""}
		 {% for item in testimonialWebapp.items %}
		 {% if item.['Image'] != '' -%}
          <li>
          <div class="testimonial-block">
              <p>{{item.description}}</p>
          </div>
          <div class="testimonial">
            <div class="testimonial-image">
                <figure><img src="{{item.['Image']}}"> </figure>
                <h4>{{item.['Name']}}</h4>
                <span>{{item.['Caption']}}</span></div>
          </div>
        </li>
        {% else -%}
        <li>
          <div class="testimonial-block">
              <p>{{item.description}}</p>
          </div>
          <div class="testimonial">
            <div class="testimonial-image">
<!--                <figure><img src="{{item.['Image']}}"> </figure>-->
                <h4>{{item.['Name']}}</h4>
                <span>{{item.['Caption']}}</span></div>
          </div>
        </li>
        {% endif -%}
        {% endfor %}