# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
	$("tbody").on("change", ".pm_project_id", ->
		console.log "Inside project change" + $(this).attr('id') +  " the value selected is " + $(this).val()    
		user_select_id = "adhoc_pm_id"
		tr = $(this).parent().parent("tr")
		console.log("tr: " + tr)
		build_users(user_select_id, $(this).val())
	)
    
	build_users = (user_id, project_id) ->
		$('#'+user_id).find('option').remove()
		console.log "Inside  build_tasks  " +  user_id +  "  " + project_id
		my_url = '/available_users/'+project_id
		$.ajax my_url,
		data: {}
		type: 'GET'
		dataType: 'json'
		success: (data, textStatus, jqXHR) ->
			$my_data = data
			console.log "data is  " + data.length + " my_data is  " + $my_data.length
			for item in $my_data
				console.log "data is "+item.code + "  "  + item.description
				$('#'+user_id).append($("<option></option>").attr("value",item.id).text(item.email))

  $('#report').hide()

  parse_row_id = (attr_val) ->
    row_id = attr_val.split("_")[4]
    return row_id

  parse_customer_row_id = (attr_val) ->
    row_id = attr_val.split("_")[0]
    return row_id

  parse_user_id = (attr_val) ->
    user_id = attr_val.split("_")[1]
    return user_id

  parse_vacation_request_id = (attr_val) ->
    row_id = attr_val.split("_")[3]
    return row_id

  parse_customer_id = (attr_val) ->
    customer_id = attr_val.split("/")[4]
    return customer_id

  $('.resend_vacation_request').click ->
    console.log("REQUEST")
    vacation_request_row_id = parse_row_id($(this).attr('id'))
    console.log("VR ROW ID: " + vacation_request_row_id)
    vacation_request_id = parse_vacation_request_id($(this).attr('id'))
    console.log(vacation_request_id)

    start = $('#vacation_start_' + vacation_request_row_id).attr('value')
    end = $('#vacation_end_' + vacation_request_row_id).attr('value')
    $('#vacation_comment_' + vacation_request_row_id).text("hi")
    #$('#vacation_comment_' + vacation_request_row_id).trigger
    c = $('#vacation_comment_' + vacation_request_row_id).text()

    console.log("START :" + start + "END :" + end + "COMMENT" + c)
    $.get "/resend_vacation_request",
      vacation_request_id: vacation_request_id,
      vacation_start: start,
      vacation_end: end
    return

  $('.remove-user-from-customer').click ->
    console.log("customers.js- romove customer")
    user_id = parse_user_id($(this).attr('id'))
    console.log("customer.js- remove form customer "+"user_id: "+ $(this).attr('id'))
    row = parse_customer_row_id($(this).attr('id'))
    console.log("customer.js- remove from customer "+"row_id: "+ row )
    customer_url=$(location).attr('href')
    customer_id = parse_customer_id(customer_url)
    $.get "/remove_user_from_customer",
  	  user_id: user_id,
  	  customer_id: customer_id,
      row: row
  	return
