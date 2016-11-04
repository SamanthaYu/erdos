function renderMath() {
	alert("hey!");
	renderMathInElement(
		document.getElementById("mathStatus"),{
			delimiters: [
				{left: "$$", right: "$$", display: true},
				{left: "\\[", right: "\\]", display: true},
				{left: "$", right: "$", display: false},
				{left: "\\(", right: "\\)", display: false}
			]
		}
	);
}

function send() {
	//katex.render(userInput.value, document.getElementById('userOutput'));
	document.getElementById('userOutput').innerHTML = userInput.value;
	render('userOutput');
}

function types() {
	//katex.render(userInput.value, document.getElementById('userTypes'));
	document.getElementById('userTypes').innerHTML = userInput.value;
	render('userTypes');
}
