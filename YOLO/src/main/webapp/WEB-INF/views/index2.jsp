<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
			<section class="caption">
			<div class="flexslider">
		<ul class="slides">
			<li><img style="height: 400PX;"
				src="${pageContext.request.contextPath}/img/index2 (1).jpg" /></li>
			<li><img style="height: 400PX;" src="${pageContext.request.contextPath}/img/index1.jpg" /></li>
			<li><img style="height: 400PX;"
				src="${pageContext.request.contextPath}/img/0M0B0169.jpg" /></li>
		</ul>
	</div>
				<!-- <h2 class="caption">Find You Dream Home</h2>
				<h3 class="properties">Appartements - Houses - Mansions</h3> -->
			</section>
	</section><!--  end hero section  -->


	<section class="search">
		<div class="wrapper" ID="SEARCHDIV">
			<form action="#" method="post">
				<input type="text" id="search" name="search" placeholder="What are you looking for?"  autocomplete="off"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
			<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
		</div>

		<div class="advanced_search">
			<div class="wrapper">
				<span class="arrow"></span>
				<form action="#" method="post">
					<div class="search_fields">
						<input type="text" class="float" id="check_in_date" name="check_in_date" placeholder="Check In Date"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="check_out_date" name="check_out_date" placeholder="Check Out Date"  autocomplete="off">
					</div>
					<div class="search_fields">
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="max_price" name="max_price" placeholder="Max. price"  autocomplete="off">
					</div>
					<input type="text" id="keywords" name="keywords" placeholder="Keywords"  autocomplete="off">
					<input type="submit" id="submit_search" name="submit_search"/>
				</form>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->

	<!-- 분류카테고리 --> 
	<div class="container"> 
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-1 dropdown"></div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-2"></div>
		<div class="dropdown">
			<ul class="nav nav-pills">
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">라이프스타일<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">독서/글쓰기</a></li>
						<li><a role="menuitem" href="#">사진/영상</a></li>
						<li><a role="menuitem" href="#">요리/베이킹</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">어학<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">뷰티<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">여기클릭 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a role="menuitem" href="#">메뉴 1</a></li>
						<li><a role="menuitem" href="#">메뉴 2</a></li>
						<li><a role="menuitem" href="#">메뉴 3</a></li>
						<li><a role="menuitem" href="#">분리된 메뉴 </a></li>
					</ul></li>
			</ul>
		</div>
		<div class="col-md-2"></div>
	</div>
	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
				<li>
					<a href="#">
						<img src="img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_2.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$1000</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_3.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_2.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$1000</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_3.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_2.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$1000</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="img/property_3.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<h2>2 kitchens, 2 bed, 2 bath... <span class="property_size">(288ftsq)</span></h2>
					</div>
				</li>
			</ul>
			<div class="more_listing">
				<a href="#" class="more_listing_btn">View More Listings</a>
			</div>
		</div>
	</section>	<!--  end listing section  -->
<%@ include file="inc/bottom.jsp" %>
