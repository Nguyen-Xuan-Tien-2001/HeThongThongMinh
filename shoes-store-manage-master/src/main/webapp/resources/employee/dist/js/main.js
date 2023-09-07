 function getIdDeleteIntoForm(idInput){
	$("a[data-delete]").on("click", function(){
		console.log($(this))
		let id = $(this).data("delete")
		$(`#${idInput}`).attr("value", id)
	})
}

function getIdUpdateIntoForm(idInput){
	$("a[data-delete]").on("click", function(){
		console.log($(this))
		let id = $(this).data("update")
		$(`#${idInput}`).attr("value", id)
	})
}

 
 function activeSidebarItem(){
	 $(".nav-item").each(function() {
		 if($(location).attr("pathname").includes($(this).attr("id"))){
			 $(this).find(".nav-link").addClass("active");
		 }
	 })
 }

function isShowModal(){
	
	let modalShow = $(".modal.fade[isShow=true]");
	
	if(modalShow){
		modalShow.modal('show')
	}
	
}

function onHideModal(myId, myUrl){
	let modalHide = $(".modal.fade[isShow=true]");
	
	if(modalHide){
		modalHide.on('hide.bs.modal', function (event) {
			if(modalHide.attr("id").includes(myId)){

				window.location.href = myUrl;
			}
			
		})
	}
}

function updateAvatar(idInput, idModal){
	 //alertify.notify("Kiểu file ảnh không hợp lệ. Vui lòng chọn ảnh .PNG hoặc .JPG", "success", 7);
	
	 let inpChangeAvatar = $(`#${idInput}`)
	
	 inpChangeAvatar.on("change", function(e){
		 console.log(inpChangeAvatar)
		 let imgAvatar = $(`#${idModal}`)
		 imgAvatar.attr("src", URL.createObjectURL(inpChangeAvatar[0].files[0]))
		 imgAvatar.on("load", function(){
			 URL.revokeObjectURL(imgAvatar.attr("src"))
		 })
	 })
}

function showModalConfirm(idButton, title, ok){
	$(`#${idButton}`).on("click", function(e){
		e.preventDefault();
		alertify.confirm(title, '', function(){
			$(`#${idButton}`).unbind("click")
			$(`#${idButton}`)[0].click()
		}
        , function(){} ).set('labels', {ok:ok, cancel:'Thoát'});

	})
}

function generateColor(){
	let r = parseInt(Math.random()*255);
	let g = parseInt(Math.random()*255);
	let b = parseInt(Math.random()*255);
	return `rgb(${r}, ${g}, ${b})`
}

function productChart(id, productLabels=[], productInfo=[]){
	let colors = []
	for(let i=0; i<productInfo.length; i++)
		colors.push(generateColor())
	
	const data = {
		labels: productLabels,
		datasets: [{
			label:'Thống kê doanh thu theo sản phẩm',
			data: productInfo,
			backgroundColor: colors,
			borderColor: colors,
			hoverOffset: 4
		}]
	};
	
	const config = {
		type: 'bar',
		data: data,
	};
	
	let ctx = document.getElementById(id).getContext("2d")
	
	new Chart(ctx, config)
}

$(document).ready(function(){
	
	generateColor();
	
	activeSidebarItem();
	
	isShowModal();
	
	// modal them
	updateAvatar("input-add-avatar", "modal-add-avatar");
	
	// modal sua
	updateAvatar("input-update-avatar", "modal-update-avatar");
	
	// button them
	showModalConfirm("cancel-save-modal", "Bạn có chắc chắn hủy?", "Hủy");
	
	// button them
	showModalConfirm("cancel-save-modal-phieunhap", "Bạn có chắc chắn hủy?", "Hủy");
	
	// button them
	showModalConfirm("cancel-update-modal-phieunhap", "Bạn có chắc chắn hủy?", "Hủy");
	
	// button doi trang thai
	showModalConfirm("btn-change-state", "Bạn có chắc chắn thực hiện thao tác này", "Xác nhận");
	
	// button sua
	showModalConfirm("cancel-update-modal", "Bạn có chắc chăn hủy?", "Hủy");
	
	// button reset mat khua
	showModalConfirm("btn-reset-mk", "Bạn có chăc chắn muốn reset mật khẩu", "OK");
	
	
	onHideModal("modal-edit-employee", "quanly/nhanvien");
	
	getIdDeleteIntoForm("input-delete-dm");
	
	getIdDeleteIntoForm("input-delete-ncc");
	
	getIdUpdateIntoForm("input-update-hd");
	
	getIdDeleteIntoForm("input-delete-pn");
	
	getIdDeleteIntoForm("input-delete-ctsp");
	
	getIdDeleteIntoForm("input-delete-ctpn");
	
	//let productLabels = []
	//let productInfo = []
	productChart('myProductStatsChart',  productLabels, productInfo);
 });