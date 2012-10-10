// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function check_info_type()
{
	var selected_text = $('#content_kind option:selected').text()
		
		if(selected_text=="Image") {
		$('#text_info').hide();
		$('#image_info').show();	
		}
		else
		if(selected_text=="Text")
		{
		$('#image_info').hide();
		$('#text_info').show();	
		}
		
}

$(document).ready(function() {
	//$('#mainNav a').click(function() {
	// var url=$(this).attr('href');
	// $('webContent').empty();
	//$('#webContent').load(url+ ' #webContent');
	

	//return false;
//});

	 
	
	check_info_type();
	$('#content_kind').change( function() { 
		check_info_type();
});
});

