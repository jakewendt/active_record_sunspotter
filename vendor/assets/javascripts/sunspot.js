jQuery(function(){

//
// perhaps make this 'div.facet_toggle *' so as to include the span triangle icon?
//
	jQuery('div.facet_toggle a').click(function(){
//		jQuery(this).parent().next().toggle(500);
//  added 'blind' so doesn't resize stuff and just slides in.
//	be advised that this effect temporarily wraps the target in a div until done.
		jQuery(this).parent().next().toggle('blind',500);
		jQuery(this).prev().toggleClass('ui-icon-triangle-1-e');
		jQuery(this).prev().toggleClass('ui-icon-triangle-1-s');
		return false;
	});

	jQuery( "#selected_columns, #unselected_columns" ).sortable({
		connectWith: ".selectable_columns"
	}).disableSelection();

//
// should this really be '<input>' and not just 'input'?
//
	jQuery('form').submit(function(){
		jQuery('#selected_columns li').each(function(){
			jQuery('<input>').attr({ 
				name: 'c[]', 
				type: 'hidden', 
				value: $(this).text() 
			}).appendTo('form');
		});
	});

	jQuery('#select_all_columns').click(function(){
		jQuery('#unselected_columns li').appendTo('#selected_columns')
		return false;
	});

	jQuery('#unselect_all_columns').click(function(){
		jQuery('#selected_columns li').appendTo('#unselected_columns')
		return false;
	});

});
