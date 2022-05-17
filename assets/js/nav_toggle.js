document.getElementsByClassName('primary_nav__toggle')[0].addEventListener('click', function(){
	var nav_list = document.getElementsByClassName('primary_nav__navlist')[0]
	if (nav_list.style.display === 'block') {
		nav_list.style.display = 'none';
	} else {
		nav_list.style.display = 'block';
	}
});
