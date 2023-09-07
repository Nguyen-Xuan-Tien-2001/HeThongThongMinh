<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!-- Header -->
<%@include file="/WEB-INF/views/shop/include/header.jsp"%>
<link href="<c:url value='resources/user/css/dexuat2.css'/>"
	rel="stylesheet">
<!-- Header End -->
<main>
	<!-- Breadcrumb Start -->
	<div class="container-fluid" style="margin-top: 254px;">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Trang chủ</a> <span
						class="breadcrumb-item active">Đề xuất sản phẩm</span>
					${danhSachSanPham.size() }
				</nav>
			</div>
		</div>
	</div>

	<!-- Breadcrumb End -->

	<!-- Shop Start -->
	<div class="container-fluid">
		<!-- multistep form -->
		<div class="container">
			<form:form action="dexuat" method="post" id="">

				<div class="wrapper">
					<ul class="steps">
						<li class="is-active">Step 1</li>
						<li>Step 2</li>
						<li>Step 3</li>
						<li>Step 4</li>
						<li>Step 5</li>
						<li>Step 6</li>
						<li>Step 7</li>
						<li>Step 8</li>
						<li>Step 9</li>
					</ul>
					<div class="form-wrapper">
						<fieldset class="section is-active">
							<h3>Phong cách mua sắm của bạn là gì?</h3>
							<div class="row cf" style="margin-bottom: 20px;">
								<div class="four col">
									<input type="radio" name="r1" id="1" value="1" checked /> <label
										for="1">
										<h4>Dù túi có rỗng hay không thì vẫn chú tâm vào quầy
											hàng hiệu.</h4>
									</label>
								</div>
								<div class="four col">
									<input path="value" type="radio" name="r1" id="2" value="2" />
									<label for="2">
										<h4>Áo sơ mi, túi xách, giày cao gót chẳng hạn.</h4>
									</label>
								</div>
								<div class="four col">
									<input path="value" type="radio" name="r1" id="3" value="3" />
									<label for="3">
										<h4>Thời trang dành riêng cho tuổi teen</h4>
									</label>
								</div>
								<div class="four col">
									<input path="value" type="radio" name="r1" id="4" value="4" />
									<label for="4">
										<h4>Hay tìm kiếm những phụ kiện độc lạ</h4>
									</label>
								</div>
								<div class="four col">
									<input path="value" type="radio" name="r1" id="5" value="5" />
									<label for="5">
										<h4>Nước hoa,mỹ phẩm,...</h4>
									</label>
								</div>
								<div class="four col">
									<input path="value" type="radio" name="r1" id="6" value="6" />
									<label for="6">
										<h4>Trang phục đường nét cơ bản, ấn tượng, chất liệu cao cấp.</h4>
									</label>
								</div>

							</div>
							<div class="button bg-primary">Next</div>
						</fieldset>
						<fieldset class="section">
						<h3>Bạn ấn tượng với bức ảnh nào nhất?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r2" id="7" value="1" checked>
								<label for="7">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://media.ngoisao.vn/news/2016/02/18/nguyen-quynh-182-1-ngoisao.vn.png">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r2" id="8" value="2"> <label
									for="8">
									<div class="img_wrapper">
									<img class="img-full-width" noretina=""
											src="https://i.pinimg.com/736x/96/78/07/9678071c1297366c2188d1ae6b965c22.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r2" id="9" value="3"> <label
									for="9">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://tripler.vn/wp-content/uploads/2019/04/embroidered-graphic-tee-t5600-4.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r2" id="10" value="4"> <label
									for="10">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://photo-baomoi.bmcdn.me/w700_r1/2018_02_17_180_25033747/329165cb808b69d5309a.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r2" id="11" value="5"> <label
									for="11">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://cdn.kkfashion.vn/8413-home_default/dam-den-co-dan-tong-vien-trang-kk105-11.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r2" id="12" value="6"> <label
									for="12">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://media.thieunien.vn/thumb/uploads/2021/06/08/trang-diem-kieu-han-dang-bi-lung-lay-do-trend-trang-diem-moi-nay_12383.jpg">
										
									</div>
								</label>
							</div>

						</div>
						<div class="button bg-primary" >Next</div>
					</fieldset>
					<fieldset class="section">
						<h3>Màu sắc mà bạn ưa chuộng?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r3" id="13" value="1" checked>
								<label for="13">
									<h4>Màu dạ quang, hồng đậm, đen.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r3" id="14" value="2"> <label
									for="14">
									<h4>Màu nude, hồng cam.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r3" id="15" value="3"> <label
									for="15">
									<h4>Màu pastel, nude, hồng ,xám</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r3" id="16" value="4"> <label
									for="16">
									<h4>Các gam màu nóng.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r3" id="17" value="5"> <label
									for="17">
									<h4>Màu tím, xanh dương đậm, đen, trắng.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r3" id="18" value="6"> <label
									for="18">
									
									<h4>Màu trắng, hồng, xanh biển,...</h4>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>
					<fieldset class="section">
						<h3>Bạn nghĩ người tâm đầu ý hợp với mình sẽ là?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r4" id="19" value="1" checked>
								<label for="19">
									<h4>1 cô bạn khá giả.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r4" id="20" value="2"> <label
									for="20">
									<h4>1 cô bạn mạnh mẽ, tự lập.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r4" id="21" value="3"> <label
									for="21">
									<h4>1 người lịch sự, chín chắn.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r4" id="22" value="4"> <label
									for="22">
									<h4>1 người vui vẻ, hòa đồng, tích cực.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r4" id="23" value="5"> <label
									for="23">
									<h4>1 cô bạn" bánh bèo" , dịu dàng, tốt bụng với bạn.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r4" id="24" value="6"> <label
									for="24">
									<h4>1 hotgirl được nhiều người chú ý.</h4>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>
					<fieldset class="section">
						<h3>Khi được tặng 1 món quà, bạn mong nó sẽ là:</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r5" id="25" value="1" checked>
								<label for="25">
									<h4>Vòng ngọc trai! Oh My God</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r5" id="26" value="2"> <label
									for="26">
									<h4>Giày cao gót mũi trơn, đồng hồ hiệu chẳng hạn.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r5" id="27" value="3"> <label
									for="27">
									<h4>1 chiếc giày màu sắc trẻ trung, kiểu dáng thoải mái.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r5" id="28" value="4"> <label
									for="28">
									<h4>Mắt kính thời trang, vòng Tattoo</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r5" id="29" value="5"> <label
									for="29">
									<h4>Chiếc váy đen có ren.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r5" id="30" value="6"> <label
									for="30">
									<h4>Món trang sức nhỏ nhắn như lắc tay.</h4>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>

					<fieldset class="section">
						<h3>Trả lời thật nhé! Đáp án nào KHÔNG ĐÚNG về con người bạn?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r6" id="31" value="1" checked>
								<label for="31">
									<h4>Bạn là người keo kiệt.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r6" id="32" value="2"> <label
									for="32">
									<h4>Thiếu lịch sự, đã tức giận thì buông lời không hay.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r6" id="33" value="3"> <label
									for="33">
									<h4>Bạn hay chậm chạp, thụ động.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r6" id="34" value="4"> <label
									for="34">
									<h4>Bạn yếu đuối.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r6" id="35" value="5"> <label
									for="35">
									<h4>Bạn hay bị "bỏ lơ, dễ lu mờ" trong tập thể.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r6" id="36" value="6"> <label
									for="36">
									<h4>Bạn là người thiếu sạch sẽ,ngăn nắp.</h4>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>

					<fieldset class="section">
						<h3>Đứa bạn thân mời bạn đến buổi dạ hội, khi đó bạn sẽ mặc
							chiếc váy dạ hội như thế nào?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r7" id="37" value="1" checked>
								<label for="37">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://lamdepwiki.com/wp-content/uploads/2019/12/dam-da-hoi-xoe-1.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r7" id="38" value="2"> <label
									for="38">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://cf.shopee.vn/file/8411ba5473671dbed290426a6d9ff67c">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r7" id="39" value="3"> <label
									for="39">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://andora.com.vn/wp-content/uploads/2022/03/thoi-trang-nu-2022-12.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r7" id="40" value="4"> <label
									for="40">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://lamdepwiki.com/wp-content/uploads/2019/12/dam-da-hoi-ngan-sang-trong-2.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r7" id="41" value="5"> <label
									for="41">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://thamdangstore.vn/Content/Images/FileUpload/userfiles/images/dam-hoa-tiet-nhe-nhang-quy-phai.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r7" id="42" value="6"> <label
									for="42">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://znews-photo.zingcdn.me/w660/Uploaded/Yfrur/2015_12_03/HA_1_1.jpg">
									</div>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>

					<fieldset class="section">
						<h3>Mái tóc nào làm bạn thấy tự tin?</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r8" id="43" value="1" checked>
								<label for="43">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://ladystars.vn/wp-content/uploads/2019/08/nhuom-toc-ombre-1.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r8" id="44" value="2"> <label
									for="44">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://baamboo.com/wp-content/uploads/2021/01/toc-thang-ngang-lung-7.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r8" id="45" value="3"> <label
									for="45">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://cdn.alongwalker.co/vn/wp-content/uploads/2022/03/26071552/image-toc-xoan-hippie-la-gi-khuon-mat-nao-phu-hop-voi-xoan-hippie-164822855241525.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r8" id="46" value="4"> <label
									for="46">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://cdn.24h.com.vn/upload/3-2021/images/2021-08-14/7-mau-toc-Han-Quoc-giup-nang-luc-nao-cung-tuoi-tre-xinh-dep-2-1628914159-797-width600height750.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r8" id="47" value="5"> <label
									for="47">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="http://giadinh.mediacdn.vn/k:2016/6-1454311629-kieu-toc-gon-gang-de-tien-vao-bep-ngay-tet-eva-7-1454404176092/nhung-kieu-toc-gon-gang-de-tien-vao-bep-ngay-tet.jpg">
									</div>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r8" id="48" value="6"> <label
									for="48">
									<div class="img_wrapper">
										<img class="img-full-width" noretina=""
											src="https://cdn.dep365.com/wp-content/uploads/2022/09/toc-uon-gon-song.jpg?strip=all&lossy=1&w=800&ssl=1">
									</div>
								</label>
							</div>
							<div class="button bg-primary" >Next</div>
					</fieldset>

					<fieldset class="section">
						<h3>Câu cuối cùng nhé! "2 từ khóa nói lên tính cách hiện tại
							của bạn?"</h3>
						<div class="row cf" style="margin-bottom: 20px;">
							<div class="four col">
								<input type="radio" name="r9" id="49" value="1" checked>
								<label for="49">
									<h4>Dịu dàng, nữ tính.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r9" id="50" value="2"> <label
									for="50">
									<h4>Độc lập, mạnh mẽ.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r9" id="51" value="3"> <label
									for="51">
									<h4>Lịch thiệp, đơn giản.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r9" id="52" value="4"> <label
									for="52">
									<h4>Phá cách, cá tính.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r9" id="53" value="5"> <label
									for="53">
									<h4>Cổ điển, tinh tế.</h4>
								</label>
							</div>
							<div class="four col">
								<input type="radio" name="r9" id="54" value="6"> <label
									for="54">
									<h4>Hòa đồng,nhanh nhẹn.</h4>
								</label>
							</div>
							<!-- <button class="submit button bg-primary" type="submit" id="">Submit</button> -->
							<input class="submit button bg-primary" type="submit"
								name="dexuat" value="Submit" />
					</fieldset>
					</div>

				</div>
				<!-- <button class="submit button bg-primary" type="submit" id="">Submit</button> -->
			</form:form>
		</div>
	</div>
	<!-- Shop Product End -->
	<!-- Shop End -->
</main>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i
	class="fa fa-angle-double-up"></i></a>

<!-- Footer -->
<%@include file="/WEB-INF/views/shop/include/footer.jsp"%>
<!-- Footer End -->


<!-- JS Lib -->
<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
<!-- JS Lib End -->
