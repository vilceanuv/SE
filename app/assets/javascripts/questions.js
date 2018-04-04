$(document).ready(function(){
	$("#yes-button").click(function(){
		$.ajax({
			url: 'questions/next_question',
			data: {
				id: $('.question-text').data('question-id'),
				value: 1
			},
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				console.log(data['qst']);
				if(data['name'] != undefined){
					$('.question-text').text(data['name']);
					$('#yes-button').remove();
					$('#no-button').remove();					
 				}else{
					$('.question-text').text(data['qst']);
				}
				$('.question-text').data('question-id', data['id']);
			}
		});
	})

	$("#no-button").click(function(){
		$.ajax({
			url: 'questions/next_question',
			data: {
				id: $('.question-text').data('question-id'),
				value: 0
			},
			contentType: "application/json; charset=utf-8",
			type: 'GET',
			dataType: 'json',
			success: function(data){
				console.log(data['qst']);
				if(data['name'] != undefined){
					$('.question-text').text(data['name']);
					$('#yes-button').remove();
					$('#no-button').remove();					
 				}else{
					$('.question-text').text(data['qst']);
				}
				$('.question-text').data('question-id', data['id']);
			}
		});
	})
})