function add(n, m) {
  return n + m;
}

function multiply(n,m) {
  return n * m;
}

function divide(n,m) {
  return n / m;
}

function subtract(n,m) {
  return n - m;
}

function createDiv(content, id, classe='') {
  var div = document.createElement('div');
  var div_content = document.createTextNode(content);
  div.appendChild(div_content);
  div.style.backgroundColor = '#fa4';
  div.style.width = '25%';
  div.style.display = 'inline-block';
  div.setAttribute('id', id);
  div.setAttribute('class', classe);
  return div;
}
numbers = ['1','2','3','+','4','5','6','-','7','8','9','*','<', '0','=','/']

for(var n of ['1','2','3']) {
	document.body.appendChild(createDiv(n, 'number'+n, 'number'));
}
document.body.appendChild(createDiv('+', 'operationPlus', 'operation'));
for(var n of ['4','5','6']) {
	document.body.appendChild(createDiv(n, 'number'+n,'number'));
}
document.body.appendChild(createDiv('-', 'operationMinus', 'operation'));
for(var n of ['7','8','9']) {
	document.body.appendChild(createDiv(n, 'number'+n,'number'));
}
document.body.appendChild(createDiv('*', 'operationMultiply', 'operation'));

document.body.appendChild(createDiv('<', 'clear'));
document.body.appendChild(createDiv('0', 'number0', 'number'));
document.body.appendChild(createDiv('=', 'equals'));
document.body.appendChild(createDiv('/', 'operationDivide', 'operation'));

var memo_1 = '';
var memo_2 = '';
var operation = '';

for(var el of document.getElementsByClassName('number')) {
	el.onclick = function(){
		if (operation === '') {
    	memo_1 += this.innerHTML;
      console.log(memo_1)
    } else {
    	memo_2 += this.innerHTML
    	console.log(memo_1 + operation + memo_2)
    }
  };
}

for(var el of document.getElementsByClassName('operation')) {
	el.onclick = function(){
		if (operation === '' ) {
    	operation = this.innerHTML;
      console.log(memo_1 + ' ' + operation);
    } else {
    	console.log('bla')
    }
  }
}
var result;
document.getElementById('equals').onclick = function() {
	if (memo_1 != '' && memo_2 != '') {
  	n = parseInt(memo_1);
    m = parseInt(memo_2);

    if (operation == '+') {
    	result = add(n,m);
    }
  }

  console.log(result);
	clear();
}

function clear() {
	memo_1 = '';
  memo_2 = '';
	operation = '';
  result = 0;
}
