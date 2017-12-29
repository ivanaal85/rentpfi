
<ul class="pagination text-center" role="navigation" aria-label="Pagination">
    {% if pagination.previousPageUrl and pagination.previousPageUrl != "" -%}
        <li class="pagination-previous"><a href="{{pagination.previousPageUrl}}" aria-label="Previous Page">Previous <span class="show-for-sr">page</span></a></li>
    {% else -%}
        <li class="pagination-previous disabled">Previous <span class="show-for-sr">page</span></li>
    {% endif -%}

    {% assign preEllipsis = false -%}
    {% assign postEllipsis = false -%}
    {% for i in (1..pagination.numberOfPages) -%}
        {% assign efinish = pagination.numberOfPages | minus: 0 -%}
        {% assign overlap = pagination.currentPage | plus: 2 -%}
        {% assign underlap = pagination.currentPage | minus: 2 -%}

        {% if i == pagination.currentPage -%}
            <li class="current"><span class="show-for-sr">You're on page</span> {{i}}</li>
        {% elseif i > 1 and i < underlap and pagination.numberOfPages > 10 and efinish > i -%}
            {% if preEllipsis == false -%}
                <li class="ellipsis" aria-hidden="true"></li>
                {% assign preEllipsis = true -%}
            {% endif -%}
        {% elseif i > pagination.currentPage and i > overlap and pagination.numberOfPages > 10 and efinish > i  -%}
            {% if postEllipsis == false -%}
                <li class="ellipsis" aria-hidden="true"></li>
                {% assign postEllipsis = true -%}
            {% endif -%}
        {% else -%}
            <li><a href="/media/page/{{i}}/" aria-label="Page {{i}}">{{i}}</a></li>
        {% endif -%}
    {% endfor -%}

    {% if pagination.nextPageUrl and pagination.nextPageUrl != "" -%}
        <li class="pagination-next"><a href="{{pagination.nextPageUrl}}" aria-label="Next page">Next <span class="show-for-sr">page</span></a></li>
    {% else -%}
        <li class="pagination-next disabled">Next <span class="show-for-sr">page</span></li>
    {% endif -%}
</ul>