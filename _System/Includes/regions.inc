{% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
  {% if globals.site.['host'] contains '.apartmenthomesmarin.'  -%}
        {% assign region = "Marin" -%}
    {% elseif globals.site.['host'] contains '.apartmenthomessonoma.' -%}    
        {% assign region = "Sonoma" -%}
    {% else -%}
        {% assign region = "RentPFI" -%}  
 {% endif -%} 