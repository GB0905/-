var $setRows = $('#setRows');

$setRows.submit(function (e) {
	e.preventDefault();
	var rowPerPage = 2;

	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	if (!rowPerPage) {
		alert(zeroWarning);
		return;
	}
	$('#list_paging').remove();
	var $products = $('#RecipeList');

	$products.after('<div id="list_paging">');


	var $tr = $($products).find('tbody tr');
	var rowTotals = $tr.length;

	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>')
				.attr('rel', i)
				.html(i + 1)
				.appendTo('#list_paging');
	}

	$tr.addClass('off-screen')
			.slice(0, rowPerPage)
			.removeClass('off-screen');

	var $pagingLink = $('#list_paging a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');

		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});

	$pagingLink.filter(':first').addClass('active');

});


$setRows.submit();