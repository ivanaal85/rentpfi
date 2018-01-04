{% capture script -%}
function searchResultsUpdate() {
$(".search-msg .loc").html( $("#CAT_Custom_28").val() );
$(".search-msg .neighborhood").html( $("#CAT_Custom_15").val() );
$(".search-msg .type").html( $("#CAT_Custom_11").val() );
var bedNum = $("#CAT_Custom_8_Min").val();
if(bedNum >= 0){
$(".search-msg .bd").html( $("#CAT_Custom_8_Min").val() + "+" );
} else {
$(".search-msg .bd").html("");
}
var bathNum = $("#CAT_Custom_9_Min").val();
if(bathNum >= 0){
$(".search-msg .bh").html( $("#CAT_Custom_9_Min").val() + "+" );
} else {
$(".search-msg .bh").html("");
}
$(".search-msg .p-range").html( formatCurrency( $("#CAT_Custom_4_Min").val() ) + " to " + formatCurrency($("#CAT_Custom_4_Max").val() ) );
$(".search-msg .a-range").html( formatNumeric( $("#CAT_Custom_7_Min").val() ) + " to " + formatNumeric($("#CAT_Custom_7_Max").val() ) );
};
function submitForm() {
$(".my-search-results").fadeOut();
var $form = $("#property-search");
var submitForm = $.post($form.attr("action"), $form.serialize(), function (html) {
var response = $(html).find('.webapp-search-results');
$("div.my-search-results").html(response);
searchResultsUpdate();
})
.done(function () {
})
.fail(function () {
})
.always(function () {
$(".my-search-results").fadeIn();
});
console.log("got here");
$('.matchheightme').matchHeight();
return false;
};
function formatCurrency(theValue) {
var neg = false;
if(theValue < 0) {
neg = true;
total = Math.abs(theValue);
}
theValue = theValue.replace(/,/g, "");
return (neg ? "-$" : '$') + parseFloat(theValue, 10).toFixed(0).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
}
function formatNumeric(theValue) {
var neg = false;
if(theValue < 0) {
neg = true;
total = Math.abs(theValue);
}
theValue = theValue.replace(/,/g, "");
return parseFloat(theValue, 10).toFixed(0).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
}
function checkWholeForm47801(theForm) {
submitForm();
return false;
}
$(document).ready(function() {
{% comment -%}If parameters were passed from another page update this pages search fields before submitting the form{% endcomment -%}
{% if globals.get.loc and globals.get.loc != "" -%}
var passedLocation = {{globals.get.loc | json}};
$('#CAT_Custom_28').val(passedLocation);
{% endif -%}
{% if globals.get.nhd and globals.get.nhd != "" -%}
var passedNeighborhood = {{globals.get.nhd | json}};
$('#CAT_Custom_15').val(passedNeighborhood);
{% endif -%}
{% if globals.get.type and globals.get.type != "" -%}
var passedType = {{globals.get.type | json}};
$('#CAT_Custom_11').val(passedType);
{% endif -%}
{% if globals.get.bd and globals.get.bd != "" -%}
var passedBedrooms = {{globals.get.bd | json}};
$('#CAT_Custom_8_Min').val(passedBedrooms);
{% endif -%}
{% if globals.get.bth and globals.get.bth != "" -%}
var passedBathrooms = {{globals.get.bth | json}};
$('#CAT_Custom_9_Min').val(passedBathrooms);
{% endif -%}
{% if globals.get.minPrice and globals.get.minPrice != "" -%}
var priceMin = {{globals.get.minPrice | json}};
{% else -%}
var priceMin = 0;
{% endif -%}
{% if globals.get.maxPrice and globals.get.maxPrice != "" -%}
var priceMax = {{globals.get.maxPrice | json}};
{% else -%}
var priceMax = $("#priceRange").data("max");
{% endif -%}
$("#CAT_Custom_4_Min").val(priceMin);
$("#CAT_Custom_4_Max").val(priceMax);
{% if globals.get.minArea and globals.get.minArea != "" -%}
var areaMin = {{globals.get.minArea | json}};
{% else -%}
var areaMin = 0;
{% endif -%}
{% if globals.get.maxArea and globals.get.maxArea != "" -%}
var areaMax = {{globals.get.maxArea | json}};
{% else -%}
var areaMax = $("#areaRange").data("max");
{% endif -%}
$("#CAT_Custom_7_Min").val(areaMin);
$("#CAT_Custom_7_Max").val(areaMax);
submitForm();
var $range = $(".range");
var track = function() {
var $this = $(this),
value = $this.prop("value").split(";");
$("#CAT_Custom_4_Min").val(value[0]);
$("#CAT_Custom_4_Max").val(value[1]);
};
$range.ionRangeSlider({
hide_min_max: true,
keyboard: true,
min: priceMin,
max: priceMax,
from: priceMin,
to: priceMax,
type: 'double',
step: 1,
prefix: "$",
grid: true,
onFinish: function (data) {
submitForm();
}
});
$range.on("change", track);
var $area = $(".area");
var tracking = function() {
var $this = $(this),
value = $this.prop("value").split(";");
$("#CAT_Custom_7_Min").val(value[0]);
$("#CAT_Custom_7_Max").val(value[1]);
};
$area.ionRangeSlider({
hide_min_max: true,
keyboard: true,
min: areaMin,
max: areaMax,
from: 0,
to: areaMax,
type: 'double',
step: 1,
prefix: "",
grid: true,
onFinish: function (data) {
submitForm();
}
});
$area.on("change", tracking);
var priceSlider = $range.data("ionRangeSlider");
var areaSlider = $area.data("ionRangeSlider");
var timer;
$('input.cat_textbox').on('input', function(){
clearTimeout(timer);
timer = setTimeout(submitForm, 600);
});
$('select').change(function () {
submitForm();
});
$("#property-search #resetBtn").click(function() {
priceMin = 0;
priceMax = $("#priceRange").data("max");
areaMin = 0;
areaMax = $("#areaRange").data("max");
priceSlider.reset();
areaSlider.reset();
$range.data("ionRangeSlider").update({min:0});
$range.data("ionRangeSlider").update({from:0});
$range.data("ionRangeSlider").update({max:priceMax});
$range.data("ionRangeSlider").update({to:priceMax});
$area.data("ionRangeSlider").update({min:0});
$area.data("ionRangeSlider").update({from:0});
$area.data("ionRangeSlider").update({max:areaMax});
$area.data("ionRangeSlider").update({to:areaMax});
$('#CAT_txtKeywords').val('');
$('select').val('');
$('input:text').val('');
$("#CAT_Custom_4_Min").val(priceMin);
$("#CAT_Custom_4_Max").val(priceMax);
$("#CAT_Custom_7_Min").val(areaMin);
$("#CAT_Custom_7_Max").val(areaMax);
submitForm();
});
});
{% endcapture -%}{{ script | strip_newlines }}