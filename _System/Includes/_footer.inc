{% comment -%}<!--must update regions, _header and _footer anytime a new domain is added to the site-->{% endcomment -%}
    {% if {{region}} == 'Marin' -%}
        {% include"/_System/Includes/_footer-marin.inc" -%}
    {% elseif {{region}} == 'Sonoma' -%}    
        {% include"/_System/Includes/_footer-sonoma.inc" %}
    {% else -%}
        {% include"/_System/Includes/_footer-rentpfi.inc" %}  
{% endif -%} 