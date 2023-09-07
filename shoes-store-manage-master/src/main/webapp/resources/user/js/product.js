function filterSizeProduct(){
	 $(".btn-filter-size").click(function () {
		 
		 if($(this).hasClass("btn-size-active")){
			 
		 }else {
			 
		 }
		 
		    $(this).toggleClass("btn-size-active");
		    let size= $(this).data("masize")
		   
		    let currentUrl = window.location.href
		    
		    
		    if(window.location.href.includes("?")){
		    	
		    	window.location.href = `${currentUrl}&s=${size}`
		    }else {
		    	window.location.href = `${currentUrl}?s=${size}`
		    	
		    }
		    	
		    
		  });
}

function filterSize(){
	$(".btn-filter-size").each(function () {
		$(this).on('click', function() {
			 $(this).toggleClass("btn-size-active");
			  $(this).data("isclick", true)
		})
	})
}



function filterColorProduct(){
	 $(".btn-filter-color-item").click(function () {
		    $(this).parent().toggleClass("border border-dark");
		   
		    $(this).data("isclick", true)
		  });
}

function filterCategories(){
	$(".category-item").each(function () {
		$(this).on('click', function () {
			$(this).data("isclick", true)
		})
	})
}

function filter(){
	
	$("#btn-fitler").on('click', function() {
		let mainurl = "sanpham?filter"
		$(".btn-filter-size").each(function () {
			if($(this).data("isclick")){
				mainurl += "&size="+$(this).data("masize")
				
			}
		})
		
		$(".btn-filter-color-item").each(function () {
			if($(this).data("isclick")){
				mainurl += "&color="+$(this).data("colorid")
				
			}
		})
		
		$(".category-item").each(function () {
			if($(this).data("isclick")){
				mainurl += "&dm="+$(this).data("dmid")
				
			}
		})
		
		console.log(mainurl)
		if(mainurl.includes("&")){
			window.location.href = mainurl;
		}
		
	})
}

function getDetailProduct(){
	$(".btn-product-buynow").click(function (){
		
		window.location.href= "sanpham/" + $(this).data("id")
	})
}

$(document).ready(function () {
 
//	filterSizeProduct();
	
	filterCategories();
	
	filterColorProduct();
	
	getDetailProduct();
	
	filterSize();
	
	filter();
});
