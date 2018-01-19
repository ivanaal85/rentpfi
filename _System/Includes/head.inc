{% comment -%}<!-- Google Tag Manager -->{% endcomment -%}
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-W82BQQD');</script>
{% comment -%}<!-- End Google Tag Manager -->{% endcomment -%}
{% include"/_System/Includes/regions.inc" %}     
{module_contentholder, name="Google Analytics {{region}}"}
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
		<title>{module_pagename}</title>
{module_webapps id="30263" filter="item" itemId="7616221" resultsPerPage="1" template="" collection="companyInfo"}
{% assign companyInfo = companyInfo.items[0] -%}
        <link rel="shortcut icon" href="/_assets/img/favicon.png" />
        <link rel="apple-touch-icon" href="/_assets/img/favicon.png" />
        <link rel="apple-touch-icon-precomposed" href="/_assets/img/favicon.png" />
        <noscript>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Source+Sans+Pro:300,400,600,700,900" rel="stylesheet">
        </noscript>
        <link href="/_assets/css/all.css" rel="stylesheet">	
{% comment -%}<!--        <link href="/_assets/css/all.css" rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'">	-->{% endcomment -%}
        <script src="//cdn.jsdelivr.net/gh/jquery/jquery@1.11.1/dist/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/gh/GREGG-CHRISTOFFERSON/modernizr@v2.8.3/modernizr.min.js" async></script>
	<!--[if lt IE 9]>
        <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
        <script src="//s3.amazonaws.com/nwapi/nwmatcher/nwmatcher-1.2.5-min.js"></script>
        <script src="//html5base.googlecode.com/svn-history/r38/trunk/js/selectivizr-1.0.3b.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
	<![endif]-->      
{% include"/_System/Includes/global-variables.inc" %}
<script>
		  function(response) {
    if (response && !response.error_message) {
      alert('Posting completed.');
    } else {
      alert('Error while posting.');
    }
  }
);
</script>








