function renderMath(element) {
	renderMathInElement(
			element, {
			delimiters: [
				{left: "$$", right: "$$", display: true},
				{left: "\\[", right: "\\]", display: true},
				{left: "$", right: "$", display: false},
				{left: "\\(", right: "\\)", display: false}
			]
		}
	);
}


function renderLastMessage() {
	var allMessages = document.getElementsByClassName('messageContent');
	var len=allMessages.length;
	renderMath(allMessages[len-1]);
}



function renderAllMessages() {
	var allMessages = document.getElementsByClassName('messageContent');

	for (var i = 0; i < allMessages.length; i++){
		renderMath(allMessages[i]);
	}
}

function renderAllUsernames() {
	var allUsernames = document.getElementsByClassName('username');

	for (var j = 0; j < allUsernames.length; j++) {
		renderMath(allUsernames[j]);
	}
}
