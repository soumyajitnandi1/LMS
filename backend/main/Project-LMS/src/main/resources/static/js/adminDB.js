function openForm() {
	document.getElementById("myForm").classList.remove("d-none")
	document.getElementById("myForm").classList.add("d-block");
	document.getElementById("sidebar").classList.add("blurred");
	document.getElementById("content").classList.add("blurred");
}

function closeForm() {
	document.getElementById("myForm").classList.remove("d-block")
	document.getElementById("myForm").classList.add("d-none");
	document.querySelector(".sidebar").classList.remove("blurred");
	document.getElementById("content").classList.remove("blurred");
}

const hideAll = () => {
	$('.content > *').hide()
}

$('document').ready(() => {
	hideAll()
})

const renderIssueRequest = () => {
	hideAll()
	$('#issue-request').show()
}

const renderReturnRequest = () => {
	hideAll()
	$('#return-request').show()
}

const renderIssueHistory = () => {
	hideAll()
	$('#issue-history').show()
}

const renderGenerateReport = () => {
	hideAll()
	$('#generate-report').show()
}