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

    //file input wrapping
    j("input[type=file]").wrap("<div class='file_wrapper'></div>").after("<button>Выберите картинку</button><span class='just_uploaded_file_name'></span>");
    j("input[type=file]").wrap("<div class='file'></div>");
    j("input[type=file].with_file_name_label").live("change", function(){
        if(j(this).val() == ""){
            j(this).parents(".file_wrapper").find(".just_uploaded_file_name").html("");
        } else{
            var files = this.files;
            for(var file in files){
                if (files[file].hasOwnProperty("type")){
                    j(this).parents(".file_wrapper").find(".just_uploaded_file_name").html(files[file].name);
                }
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

    var content_height = parseInt(j("#content").css("height"));
    if (content_height < 280) content_height = 260
    sidebar_height = (content_height + 20).toString() + "px";
    j("#sidebar").css("height", (parseInt(content_height) + 20).toString() + "px");
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