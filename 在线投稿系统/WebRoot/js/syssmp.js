function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}
function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}
function sybtdown(svlt, tname) {
	var pnum = $("#hpagenum").val();
	if (Number(pnum) != 1) {
		$("#fm").attr("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}
function syybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	if (Number(pnum) > 1) {
		$("#fm").attr("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}

function xyybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	var pnums = $("#hpagenums").val();
	
	//alert(Number(pnum) < Number(pnums));
	if (Number(pnum) < Number(pnums)) {
		$("#fm").attr("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}

function wybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	var pnums = $("#hpagenums").val();
	if (Number(pnum) != Number(pnums)) {
		$("#fm").attr("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}