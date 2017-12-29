<script>
$(document).ready(function() {
   var referrer =  document.referrer;

//	window.alert(document.referrer);
if((referrer.toLowerCase().indexOf("apartmenthomesmarin.bizdev.studio") !== -1) || (referrer.toLowerCase().indexOf("apartmenthomesmarin.worldsecuresystems.com") !== -1) ||
(referrer.toLowerCase().indexOf("apartmenthomesmarin.com") !== -1) ||
(referrer.toLowerCase().indexOf("marinapartmenthomes.com")!== -1)){
//	window.alert("Came from Marin")
	$("#MarinHeader").show();
	$("#MarinFooter").show();
	$("#MarinAboutPage").show(); 
	$("#MarinApartmentListingsPage").show();
	$("#MarinBlogList").show(); 
	$("#MarinOurManagerPage").show();
	$("#MarinHeroSlider").show();
	$("#MarinInnerSidePanel").show();
	$("#MarinSearchBox").show();
	$("#MarinRecentProperty").show();
	$("#MarinHomeFeaturedProperties").show();
	$("#MarinHomeOurManagers").show();
	$("#MarinTestimonials").show();
	$("#MarinBlogRecentProperty").show();
	$("#MarinNewsletter").show();
	$("#MarinAnnouncements").show();
	$("#MarinSiteMap").show();
}else{
	if((referrer.toLowerCase().indexOf("apartmenthomessonoma.com") !== -1)|| 
(referrer.toLowerCase().indexOf("apartmenthomessonoma.worldsecuresystems.com") !== -1) ||
(referrer.toLowerCase().indexOf("apartmenthomessonoma.bizdev.studio") !== -1)) {			  
//	window.alert("Came from Sonoma")
	$("#SonomaHeader").show();
	$("#SonomaFooter").show();
	$("#SonomaAboutPage").show(); 
	$("#SonomaApartmentListingsPage").show();
	$("#SonomaBlogList").show();
	$("#SonomaOurManagerPage").show();
	$("#SonomaHeroSlider").show();
	$("#SonomaInnerSidePanel").show();
	$("#SonomaSearchBox").show();
	$("#SonomaHomeRecentProperties").show();
	$("#SonomaHomeFeaturedProperties").show();
	$("#SonomaHomeOurManagers").show();
	$("#SonomaTestimonials").show();
	$("#SonomaBlogRecentProperty").show();
	$("#SonomaNewsletter").show();
	$("#SonomaAnnouncements").show();
	$("#SonomaSiteMap").show();
	}else{
//	window.alert("Came from either RentPFI or External")
	$("#RentPFIHeader").show();
	$("#RentPFIFooter").show();
	$("#RentPFIAboutPage").show();
	$("#RentPFIApartmentListingsPage").show(); 
	$("#RentPFIBlogList").show();
	$("#MarinOurManagerPage").show();
	$("#SonomaOurManagerPage").show();
	$("#RentPFIHeroSlider").show();
	$("#RentPFIInnerSidePanel").show();
	$("#RentPFISearchBox").show();
	$("#RentPFIHomeRecentProperties").show();
	$("#RentPFIHomeFeaturedProperties").show();
	$("#MarinBlogRecentProperty").show();
	$("#SonomaBlogRecentProperty").show();
	$("#RentPFINewsletter").show();
	$("#RentPFITestimonials").show();
	$("#RentPFIAnnouncements").show();
	$("#RentPFISiteMap").show();
	}
}
	});
	</script>