

<!--<div class="search-result">   <h3>{tag_counter}. {tag_image} {tag_name}</h3>   <p>{tag_description}</p>  </div>  -->
 {% if item.description != '' %}
          <ul>
          <li class="search-result">   <h3>{{counter}}. {{image_url}} {{name}}</h3>   <p>{{description}}</p>  </li>  
           </ul>
           {% endif -%}


