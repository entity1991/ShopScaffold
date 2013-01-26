//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree

j = jQuery.noConflict();

//triggers
j(document).ready(function(){
    j("html").click(function(e){
        if(parseInt(j("#signin_window").css("top")) >= 0){
            if (!hasParent(e.target, "signin_window") && e.target.id != "signin_window") {
                j("#signin_window").animate({top: "-250px"}, 1000);
            }
        }
    });

    j("#signin_window_toggler").click(function(){
        if(parseInt(j("#signin_window").css("top")) < 0){
            j("#signin_window").animate({top: "0"}, 1000);
        }

    });

    j(".flash span").click(function(){
        j(this).parent(".flash").remove();
    });

    if(j("#sidebar").length == 0){
        j("#content").css("width", "100%");
    }
});

//functions
function hasParent(element, parentId){
    var parentsId = j(element).parents().map(function(){return this.id}).get();
    var isParent = false;
    for(var id in parentsId){
        if(parentsId[id] != parentId) continue
        isParent = true;
    }
    return isParent;
}