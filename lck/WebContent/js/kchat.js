window.onload = function() {

    
    //login btn
    
    // <![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('5bdfdc5965ae55d63fcaf7d02c0d16ae');
    // 카카오 로그인 버튼을 생성합니다.
//    Kakao.Auth.createLoginButton({
//	container : '#kakao-login-btn',
//	success : function(authObj) {
//	    //alert(JSON.stringify(authObj));
//	},
//	fail : function(err) {
//	    //alert(JSON.stringify(err));
//	}
//    });
    // ]]>

    
    //chat btn
    
    
    // <![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
	container : '#kakao-talk-channel-chat-button',
	channelPublicId : '_Mnclxb' // 카카오톡 채널 홈 URL에 명시된
							// id로 설정합니다.
    });
    // ]]>
};