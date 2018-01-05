 {% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
 {% if globals.site.['host'] contains 'apartmenthomesmarin.'  -%}
        {% include"/_System/Includes/_header-marin.inc" %}
        {% assign region = 'Marin'-%}
    {% elseif globals.site.['host'] contains 'apartmenthomessonoma.' -%}    
        {% include"/_System/Includes/_header-sonoma.inc" %}
        {% assign region = 'Sonoma'-%}
    {% else -%}
        {% include"/_System/Includes/_header-rentpfi.inc" %}
        {% assign region = 'RentPFI'-%}
 {% endif -%}  