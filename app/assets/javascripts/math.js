function renderMath(element) {
	renderMathInElement(
			element,{
			delimiters: [
				{left: "$$", right: "$$", display: true},
				{left: "\\[", right: "\\]", display: true},
				{left: "$", right: "$", display: false},
				{left: "\\(", right: "\\)", display: false}
			]
		}
	);
}

function send(data) {
	//katex.render(userInput.value, document.getElementById('userOutput'));
	document.getElementById('userOutput').innerHTML = data.message;
	renderMath('userOutput');
}

function types() {
	//katex.render(userInput.value, document.getElementById('userTypes'));
	document.getElementById('userTypes').innerHTML = userInput.value;
	renderMath('userTypes');
}

function renderAllMessages() {
	var allMessages = document.getElementsByClassName('messageContent');

	for (var i = 0; i < allMessages.length; i++){
		renderMath(allMessages[i]);
	}
}
