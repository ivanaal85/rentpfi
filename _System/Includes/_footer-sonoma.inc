<a class="scrollup" href="#" style="display: none;"><em class="fa fa-angle-up" aria-hidden="true"></em></a>
<footer>
  <div class="row">
    <div class="large-12 columns">
      <div class="footer-top">
        <div class="row">
          <div class="large-3 columns footer_about">
            <h6>ABOUT US </h6>
            <p>{{companyInfo['Footer - About Us - Sonoma']}}</p>
          </div>
          <div class="large-2 columns footer_quicklink">
            <h6>QUICK LINKS</h6>
            <div class="arrow-nav">
              {module_menu menuId="1812455"}
            </div>
          </div>
          <div class="large-2 left footer_service">
            <h6>SERVICES</h6>
            <div class="arrow-nav">
              <ul>
               {module_webapps id="Service" filter="latest" useBackupTemplate="true" resultsPerPage="3"}
              </ul>
            </div>
          </div>
          <div class="large-2 columns footer_helplink">
            <div class="helpful-content">
              <h6>HELPFUL LINKS</h6>
              <div class="footer-menu">
                {module_menu menuId="1813067"}
              </div>
            </div>
          </div>
          <div class="large-3 columns footer_info">
            <h6>CONTACT US</h6>
            <div class="contact-info">
              <p><em class="fa fa-map-marker"></em>{{companyInfo['Address']}}</p>
              <!--<p><em class="fa fa-phone"></em> Phone:<a href="tel: {{companyInfo['Phone Number']}}">{{companyInfo['Phone Number']}}</a></p>-->
              <p><em class="fa fa-envelope"></em>Email:<a href="mailto: {{ companyInfo['Email'] | url_param_escape }}">{{ companyInfo['Email'] | replace: '@', '&#64;' }}</a></p>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>©{{globals.site.dateNow | date: "yyyy"}} {{companyInfo['Company Name Sonoma']}}. All rights reserved.</p>
        <div class="right">
          <p><a href="/website/site-map"> Site Map</a> &nbsp;/&nbsp; <a href="/website/privacy">Privacy Policy</a></p>
        </div>
      </div>
    </div>
  </div>
</footer>