// ======= Placeholder Plugin =========================================
/*! http://mths.be/placeholder v2.0.7 by @mathias */
;(function(f,h,$){var a='placeholder' in h.createElement('input'),d='placeholder' in h.createElement('textarea'),i=$.fn,c=$.valHooks,k,j;if(a&&d){j=i.placeholder=function(){return this};j.input=j.textarea=true}else{j=i.placeholder=function(){var l=this;l.filter((a?'textarea':':input')+'[placeholder]').not('.placeholder').bind({'focus.placeholder':b,'blur.placeholder':e}).data('placeholder-enabled',true).trigger('blur.placeholder');return l};j.input=a;j.textarea=d;k={get:function(m){var l=$(m);return l.data('placeholder-enabled')&&l.hasClass('placeholder')?'':m.value},set:function(m,n){var l=$(m);if(!l.data('placeholder-enabled')){return m.value=n}if(n==''){m.value=n;if(m!=h.activeElement){e.call(m)}}else{if(l.hasClass('placeholder')){b.call(m,true,n)||(m.value=n)}else{m.value=n}}return l}};a||(c.input=k);d||(c.textarea=k);$(function(){$(h).delegate('form','submit.placeholder',function(){var l=$('.placeholder',this).each(b);setTimeout(function(){l.each(e)},10)})});$(f).bind('beforeunload.placeholder',function(){$('.placeholder').each(function(){this.value=''})})}function g(m){var l={},n=/^jQuery\d+$/;$.each(m.attributes,function(p,o){if(o.specified&&!n.test(o.name)){l[o.name]=o.value}});return l}function b(m,n){var l=this,o=$(l);if(l.value==o.attr('placeholder')&&o.hasClass('placeholder')){if(o.data('placeholder-password')){o=o.hide().next().show().attr('id',o.removeAttr('id').data('placeholder-id'));if(m===true){return o[0].value=n}o.focus()}else{l.value='';o.removeClass('placeholder');l==h.activeElement&&l.select()}}}function e(){var q,l=this,p=$(l),m=p,o=this.id;if(l.value==''){if(l.type=='password'){if(!p.data('placeholder-textinput')){try{q=p.clone().attr({type:'text'})}catch(n){q=$('<input>').attr($.extend(g(this),{type:'text'}))}q.removeAttr('name').data({'placeholder-password':true,'placeholder-id':o}).bind('focus.placeholder',b);p.data({'placeholder-textinput':q,'placeholder-id':o}).before(q)}p=p.removeAttr('id').hide().prev().attr('id',o).show()}p.addClass('placeholder');p[0].value=p.attr('placeholder')}else{p.removeClass('placeholder')}}}(this,document,jQuery));

// ======= Active Nav =================================================
var path = location.pathname.substring(1);
if (path) { // if there is a value for the varible path

    /*-- for the primary nav - if path equals the href give the parent a class of selected
             example: nav ul li.selected a --*/
    $('nav a[href$="' + path + '"]').parent().addClass('selected');

    /*-- for dropdown nav - if path equals the href of the drop down links give the top level link a class of selected
             example: nav ul li.selected a --*/
    $('nav ul ul a[href$="' + path + '"]').parents(':eq(2)').addClass('selected');

    /*-- for the aside nav - if path equals the href give the parent a class of selected
             example: aside ul li.selected a --*/
    $('aside li a[href$="' + path + '"]').parent().addClass('selected');
};


//=======search============//
$('.search-icon span').click(function(){
		$('.search-container').toggle();
});

	// When user clicks on forgot password link:
	// Sign In form hides, Forgot password form shows
    $("#btn-password").on('click', function (e) {
        e.preventDefault();
        $("#form-login").fadeOut(function(){
		   $("#form-password").fadeIn();
		});
    });
	// When user clicks on Nevermind link:
	// Sign In form shows, Forgot password form hides
    $("#btn-login").on('click', function (e) {
        e.preventDefault();
        $("#form-password").fadeOut(function(){
			$("#form-login").fadeIn();
		});
    });
	// Will show the Create Account form once clicked
    $("#needCreate").on('click', function (e) {
        e.preventDefault();
        $(".create-form").fadeIn();
    });

//============detail page social share=============//
;(function($){
  
  /**
   * jQuery function to prevent default anchor event and take the href * and the title to make a share popup
   *
   * @param  {[object]} e           [Mouse event]
   * @param  {[integer]} intWidth   [Popup width defalut 500]
   * @param  {[integer]} intHeight  [Popup height defalut 400]
   * @param  {[boolean]} blnResize  [Is popup resizeabel default true]
   */
  $.fn.customerPopup = function (e, intWidth, intHeight, blnResize) { 
    
    // Prevent default anchor event
    e.preventDefault();
    
    // Set values for window
    intWidth = intWidth || '500';
    intHeight = intHeight || '400';
    strResize = (blnResize ? 'yes' : 'no');
      
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top; 
      
    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;  
      
    var left = ((width / 2) - (intWidth / 2)) + dualScreenLeft;
    var top = ((height / 2) - (intHeight / 2)) + dualScreenTop;  

    // Set title and open popup with focus on it
    var strTitle = ((typeof this.attr('title') !== 'undefined') ? this.attr('title') : 'Social Share'),
        strParam = 'width=' + intWidth + ',height=' + intHeight + ', top=' + top + ', left=' + left +',resizable=' + strResize, 
        objWindow = window.open(this.attr('href'), strTitle, strParam).focus();
  }

  /* ================================================== */
  
  $(document).ready(function ($) {
    $('.customer.share').on("click", function(e) {
      $(this).customerPopup(e);
    });
  });
    
}(jQuery));




