 {% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
 {% case globals.site.['host'] -%}
    {% when 'www.apartmenthomesmarin.com'-%}
        {% include"/_System/Includes/_header-marin.inc" %}
        {% assign region = 'Marin'-%}
    {% when 'www.apartmenthomessonoma.com' -%}    
        {% include"/_System/Includes/_header-sonoma.inc" %}
        {% assign region = 'Sonoma'-%}
    {% else -%}
        {% include"/_System/Includes/_header-rentpfi.inc" %}
        {% assign region = 'RentPFI'-%}
 {% endcase -%}     