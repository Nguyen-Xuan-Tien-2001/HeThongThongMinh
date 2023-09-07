const header_fixed = $(".header-fixed");
const header_fixed_height = header_fixed[0].offsetHeight ;
	
  //   Xử lý Scroll
    document.onscroll = function () {
        
        const newHeight = window.scrollY || document.documentElement.scrollTop;
        if(header_fixed_height - newHeight <= 0){
        	header_fixed[0].style.height = 0;
        	header_fixed[0].style.opacity = 0;
        	header_fixed[0].classList.remove('d-lg-flex');
        	header_fixed[0].classList.add('d-none');
        }else{
        	header_fixed[0].style.height = header_fixed_height - newHeight + 'px';
        	header_fixed[0].style.opacity = 1- (newHeight / header_fixed_height);
        	header_fixed[0].classList.add('d-lg-flex');
        	header_fixed[0].classList.remove('d-none');
        }
      };