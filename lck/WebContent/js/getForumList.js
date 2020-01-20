var i = 0;
var list = $
{
    requestScope.forumList
};
var post = document.getElementById('post');
console.log(list);
for (i = 0; i < list.length; i++) {

    // list[i].postFile 에 대하여
    // 잘못 가져온 사진. 첨부파일의 사진이 아닌, 프로필 사진(IdentityPhoto)을 가져오도록 해야한다.

    post.innerHTML += "<div class='post'>" + "<div class='wrap-ut pull-left'>"
	    + "<div class='userinfo pull-left'>" + "<div class='avatar'>"
	    + "<img style='height: 37px; width: 37px;' src="
	    + list[i].identityPhoto
	    + "></img>"
	    + "</div>"
	    + "</div>"
	    + "<div class='posttext pull-left'>"
	    + "<h2><a href='#' onClick='' style='color: black;'>"
	    + list[i].postSubject
	    + "</a></h2>"
	    + "</div>"
	    + "<div class='clearfix'></div>"
	    + "</div>"
	    + "<div class='postinfo pull-left'>"
	    + "<div class='comments'>"
	    + "<div class='commentbg'>560"
	    + "<div class='mark'></div>"
	    + "</div>"
	    + "</div>"
	    + "<div class='views'>"
	    + "<i class='fa fa-eye'></i> 1,568"
	    + "</div>"
	    + "<div class='time'>"
	    + "<i class='fa fa-clock-o'></i> <a href='#' onClick='event.preventDefault()' style='color: #9da6aa; cursor: default; font-size: 12px;'>"
	    + list[i].postDate
	    + "</a>"
	    + "</div>"
	    + "</div>"
	    + "<div class='clearfix'></div>" + "</div>";

}