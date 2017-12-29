$(document).ready(function() {
                
                var originalActionUrl = $("#home-search").attr("action"),
                    priceSliderChanged = false,
                    areaSliderChanged = false;
                
                function updateAction(){
                    
                    var action = "";
                    if ($("#CAT_Custom_13").val() != "*"){action = action + "&loc=" + $("#CAT_Custom_13").val();}
                    if ($("#CAT_Custom_11").val() != "*"){action = action + "&type=" + $("#CAT_Custom_11").val();}
                    if ($("#CAT_Custom_8_Min").val() != "*"){action = action + "&bd=" + $("#CAT_Custom_8_Min").val();}
                    if ($("#CAT_Custom_9_Min").val() != "*"){action = action + "&bth=" + $("#CAT_Custom_9_Min").val();}
                    
                    if (priceSliderChanged) {
                   	 	action = action + "&minPrice=" + $("#CAT_Custom_4_Min").val();
                   	 	action = action + "&maxPrice=" + $("#CAT_Custom_4_Max").val();
                    }
                    if (areaSliderChanged) {
                   	 	action = action + "&minArea=" + $("#CAT_Custom_7_Min").val();
                   	 	action = action + "&maxArea=" + $("#CAT_Custom_7_Max").val();
                    }
                    
                    $("#home-search").attr("action", originalActionUrl + action)
                    
                }
                
                $('select').change(function () {
                    updateAction();
                });
                
                
                // Price Range, init the slider and then update hidden fields with values after the slider is moved
                var priceMin = $("#priceRange").data("min");
                var priceMin = 0;
                var priceMax = $("#priceRange").data("max");
                
                $("#CAT_Custom_4_Min").val(priceMin);
                $("#CAT_Custom_4_Max").val(priceMax);
                
                
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
                        priceSliderChanged = true;
                        console.log("You changed the price");
                        updateAction();
                    }
                });
                
                $range.on("change", track);
                
                // Area range slider, init the slider and then update hidden fields with values after the slider is moved	
                var areaMin = $("#areaRange").data("min");
                var areaMax = $("#areaRange").data("max");
                $("#CAT_Custom_7_Min").val(areaMin);
                $("#CAT_Custom_7_Max").val(areaMax);
                
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
                        areaSliderChanged = true;
                        console.log("You changed the area");
                        updateAction();
                    }
                });
                
                $area.on("change", tracking);  
                
                var priceSlider = $range.data("ionRangeSlider");
                var areaSlider = $area.data("ionRangeSlider");
                
            });   
              
              
              function checkWholeForm97013(theForm) {
                  var why = "";
                  if (why != "") {
                      alert(why);
                      return false;
                  }
                  
                  return true;
              }