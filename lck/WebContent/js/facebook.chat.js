
//window.onload = function() {
//    
//    f_id = document.getElementById("fb-customerchat"); 
//    f_id.setAttribute("page_id", "101334981419373");
//    f_id.setAttribute("theme_color", "0084ff");
//
//};


window.fbAsyncInit = function() {
    FB.init({
	xfbml : true,
	version : 'v5.0'
    });
};

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id))
	return;
    js = d.createElement(s);
    js.id = id;
    js.src = 'https://connect.facebook.net/ko_KR/sdk/xfbml.customerchat.js';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
