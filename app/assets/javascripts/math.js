function see() {
	alert("why?");
}

function renderMath(data) {
	alert("Hey!");
	renderMathInElement(
		document.getElementById(mathDiv),{
			delimiters: [
				{left: "$$", right: "$$", display: true},
				{left: "\\[", right: "\\]", display: true},
				{left: "$", right: "$", display: false},
				{left: "\\(", right: "\\)", display: false}
			]
		}
	);
}

function send(data.message) {
	//katex.render(userInput.value, document.getElementById('userOutput'));
	document.getElementById('userOutput').innerHTML = data.message;
	renderMath('userOutput');
}

function types() {
	//katex.render(userInput.value, document.getElementById('userTypes'));
	document.getElementById('userTypes').innerHTML = userInput.value;
	renderMath('userTypes');
}
