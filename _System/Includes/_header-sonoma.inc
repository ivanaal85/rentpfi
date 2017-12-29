<section class="search-container">
<div class="row">
<div class="medium-12 columns">
<form name="catsearchform82408" method="post" action="/Default.aspx?SiteSearchID=3206&amp;PageID=17248911">
    <div class="row">
    <div class="medium-9 columns"><input type="text" class="cat_textbox_small" name="CAT_Search" id="CAT_Search"></div>
    <div class="medium-3 columns"><input type="submit" class="button small" value="Search" style="width: 100%;"></div>
    </div>
</form>
</div>
</div>
</section>
<header>
  <div class="utility-nav">
    <div class="row">
      <div class="medium-12 column">
        <div class="header-social">
          {module_contentholder, name="Company Social Links"}
        </div>
        <div class="utility-detail">
          <ul>
              <li><span><img src="/_assets/img/header-mail-icon.png"> </span>
              <p> Email us at: <a href="mailto:{{ companyInfo['Email'] | url_param_escape }}"> {{ companyInfo['Email'] | replace: '@', '&#64;' }}</a></p>
            </li>
            {%if globals.user.isLoggedIn%}
            <li><a href="/users/account">My Account</a></li>
            <li><a href="/LogOutProcess.aspx">Sign Out</a></li>
            {%else%}
              <li><span><img src="/_assets/img/register-icon.png"></span><a href="/users/join">Register</a></li>
              <li><span><img src="/_assets/img/login-icon.png"></span><a href="/users/account">Login</a></li>
            {%endif%}
             <li><div class="search-icon"><span class="fa fa-search"></span></div></li>
            
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div id="menu-offscroll" class="primary-nav">
    <div class="row">
      <div class="medium-12 column">
        <nav class="top-bar" data-topbar role="navigation">
          <ul class="title-area">
            <li class="name">
              <h1><a href="/"><img src="{{ companyInfo['Sonoma Logo']}}" alt="logo"></a></h1>
            </li>
            <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
          </ul>
          <section class="top-bar-section">
            <ul>
               {module_menu, version="2", menuId="1812453", moduleTemplateGroup="Default"}
            </ul>
          </section>
        </nav>
		{module_webapps collection="companyInfoWebapp" render="collection" id="Company Info" filter="item" itemId="7616221" template=""}
		{% for item in companyInfoWebapp.items %}
		{% if item.['Phone Number'] != '' %}
        <div class="header-phone">
          <figure><em class="fa fa-mobile"></em></figure>
          <div class="phone-detail">
            <p>CALL US NOW</p>
            <h6><a href="tel:{{companyInfo['Footer - Phone Number']}}">{{companyInfo['Footer - Phone Number']}}</a></h6>
          </div>
        </div>
		{% endif -%}
		{% endfor -%}
      </div>
    </div>
  </div>
</header>