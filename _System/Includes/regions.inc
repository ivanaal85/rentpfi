{% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
  {% if globals.site.['host'] contains 'apartmenthomesmarin.'  -%}
        {% assign region = "Marin" -%}
        {% assign county = {{region}} -%}
        {% assign citiesServed = "San Rafael & Novato" -%}
        {% assign where = "in " {{county}} -%}
        {% assign where = {{where | append:{{county}} -%}
        {% assign site = "Apartment Homes Marin" -%}
        {% assign canonicalHost = "http://www.apartmenthomesmarin.com" -%}
    {% elseif globals.site.['host'] contains 'apartmenthomessonoma.' -%}    
        {% assign region = "Sonoma" -%}
        {% assign county = {{region}} -%}
        {% assign citiesServed = "Sonoma" -%}
        {% assign where = "in " -%}
        {% assign where = {{where | append:{{county}} -%}
        {% assign site = "Apartment Homes Sonoma" -%}
        {% assign canonicalHost = "http://www.apartmenthomessonoma.com" -%}
    {% else -%}
        {% assign region = "RentPFI" -%} 
        {% assign county = "Marin & Sonoma" -%}
        {% assign citiesServed = "San Rafael, Novato & Sonoma" -%}
        {% assign where = "in " -%}
        {% assign where = {{where | append:{{county}} -%}
        {% assign site = {{globals.site.name}} -%}
        {% assign canonicalHost = "http://www.rentpfi.com" -%}
 {% endif -%}

{% capture thisPageAddress -%}{module_pageaddress}{% endcapture -%}
{% capture pageAddress -%}{{thisPageAddress | remove: globals.site.host | remove: 'http://' | remove: 'https://' }}{% endcapture -%}

