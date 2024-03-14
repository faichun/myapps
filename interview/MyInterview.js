let filterKey = "*";
let filterQuestion = "";
let xmlDoc_os = loadXMLDoc("MyInterview-OS.xml");
let xmlDoc_networking = loadXMLDoc("MyInterview-Networking.xml");
let xslDoc = loadXMLDoc("MyInterview.xsl");
let currentXmlDoc = xmlDoc_os;

function goDefault() {
  displayResult(xmlDoc_os);
}

function loadXMLDoc(filename) {
  if (window.ActiveXObject) {
    xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  } else {
    xhttp = new XMLHttpRequest();
  }
  xhttp.open("GET", filename, false);
  try {
    xhttp.responseType = "msxml-document"
  } catch (err) {
  } // Helping IE11
  xhttp.send("");
  return xhttp.responseXML;
}

function displayResult(xmlDoc) {
  if (window.ActiveXObject || xhttp.responseType === "msxml-document") {
    // code for IE
    document.getElementById("resultBody").innerHTML = xmlDoc.transformNode(xslDoc);
  } else if (document.implementation && document.implementation.createDocument) {
    // code for Chrome, Firefox, Opera, etc.
    let xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xslDoc);
    xsltProcessor.setParameter(null, "filterQuestion", filterQuestion);
    let resultDocument = xsltProcessor
            .transformToFragment(xmlDoc, document);
    document.getElementById("resultBody").innerHTML = new XMLSerializer().serializeToString(resultDocument);
  }
}

function getQuestion() {
  filterQuestion = document.getElementById("questionFilterInput").value;
  if (filterQuestion == '') {
    filterQuestion = '*';
  }
  displayResult(currentXmlDoc);
  if (filterQuestion != '*') {
    document.getElementById("questionFilterInput").value = filterQuestion;
  }
  document.getElementById("questionFilterInput").focus();
}

function goQuestionBank(which) {
  filterQuestion = document.getElementById("questionFilterInput").value;
  switch(which) {
    case 'OS':
      displayResult(xmlDoc_os);
      currentXmlDoc = xmlDoc_os;
      break;
    case 'NETWORKING':
      displayResult(xmlDoc_networking);
      currentXmlDoc = xmlDoc_networking;
      break;
    default:
      break;
  }
  document.getElementById("questionFilterInput").value = filterQuestion;
}

function resetInput() {
  document.getElementById('questionFilterInput').value = '';
  getQuestion();
}