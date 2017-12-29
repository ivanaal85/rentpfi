{% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
  {% case globals.site.['host'] -%}
    {% when 'www.apartmenthomesmarin.com'-%}
        {% assign region = "Marin" -%}
    {% when 'www.apartmenthomessonoma.com' -%}    
        {% assign region = "Sonoma" -%}
    {% else -%}
        {% assign region = "RentPFI" -%}  
 {% endcase -%} 