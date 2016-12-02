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

	$('option .katex-mathml').remove();	// Remove double rendering in dropdown menu by getting rid of MathML elements here
}

function renderLastMessage() {
	var allMessages = document.getElementsByClassName('messageContent');
	var len=allMessages.length;
	renderMath(allMessages[len-1]);
}

function renderThisMessage(calltag){
	var thisMessage = document.getElementById(calltag);
	renderMath(thisMessage);
}

function renderLastUsername() {
	var allUsernames = document.getElementsByClassName('username');
	var len=allUsernames.length;
	renderMath(allUsernames[len-1]);
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

function renderAllButtons() {
	var allButtons = document.getElementsByClassName('mathButton');

	for (var j = 0; j < allButtons.length; j++) {
		renderMath(allButtons[j]);
	}
}
