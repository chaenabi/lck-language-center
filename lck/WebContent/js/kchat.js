window.onload = function() {
//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('5bdfdc5965ae55d63fcaf7d02c0d16ae');
		// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
		Kakao.Channel.createChatButton({
		    container : '#kakao-talk-channel-chat-button',
		    channelPublicId : 'http://pf.kakao.com/_Mnclxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
		});
		//]]>
  };