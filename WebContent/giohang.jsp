<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.MONHANG_OBJ"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- phần đường khoảng trắng dưới menu  -->
<jsp:include page="header.jsp"></jsp:include>
<%
GIOHANG_MOD giohang_mod=(GIOHANG_MOD)session.getAttribute("giohang");
%>
<div id="breadcrumb_background"></div>
<div id="body-wrapper">
	<div id="outer-wrapper">
		<div id="wrap2">
			<div id="content-wrapper">
				<div id="main-wrapper">
					<div class="main section" id="main">
						<div class="widget Blog" id="Blog1">
							<div class="blog-posts hfeed">
								<div class="date-outer">
									<div class="date-posts">
										<div class="post-outer">
											<div class="wrapfullpost">
												<div class="post hentry">
													<ul id="breadcrumbs-mbl">
														<li><a href="index.jsp"><img
																src="Images/icon-home.png" style="vertical-align: -1px;"></a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a href="#">Giỏ hàng</a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a class="current">Chọn sản phẩm</a></li>
													</ul>



												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
								    	int soluong=0;
								    	if(giohang_mod!=null)
								    	{
								    		soluong=giohang_mod.SoluongMonhang();
								    	} 
								    %>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">
					Giỏ hàng của bạn (<%=soluong %>)
				</h1>
				<div class="proc-rela">
					<div class="feat_prod_box_details">
						<table class="cart_table">
							<tr class="cart_title">


								<td style="text-align: center">Tên sản phẩm</td>
								<td>Số lượng</td>
								<td>Đơn giá</td>
								<td>Thành tiền</td>
								<td>Xóa</td>
							</tr>
							<%
								                	if(giohang_mod!=null)
								                	{
									                	for(int i=0;i<giohang_mod.SoluongMonhang();i++)
									                	{
									                		MONHANG_OBJ monhang_obj=giohang_mod.getGiohang().get(i);
									                		
									   %>


							<tr>

								<td><%=monhang_obj.getTensp() %></td>
								<td><%=monhang_obj.getSoluong() %></td>
								<td><fmt:formatNumber value="<%=monhang_obj.getGiasp() %>" minFractionDigits="0"/>đ</td>
								<td><fmt:formatNumber value="<%=monhang_obj.thanhTien() %>" minFractionDigits="0"/>đ</td>
								<td style="text-decoration: underline; color: #00F"><a
									href="Giohang.do?masp=<%=monhang_obj.getMasp()%>">Xóa</a></td>
							</tr>
							<% 
									                	}
								                	}
								              %>
						</table>

						<div class="cart_form_vien">
							<div class="cart_form_subtitle">Total</div>
							<%
								    	int tongtien=0;
								    	if(giohang_mod!=null)
								    	{
								    		tongtien=giohang_mod.Tongtien();
								    	} 
								    %>
							<a style="font-size: 18px; color: #20C8EC">Tổng cộng: <b
								style="color: red; font-size: 18px"><fmt:formatNumber value="<%=tongtien %>" minFractionDigits="0"/>đ<sup>
										</sup></b></a>
						</div>


						<a href="index.jsp" class="continue"
							style="color: #fff; text-decoration: none;">Mua Tiếp</a> <a
							href="Thanhtoan.do" class="checkout"
							style="color: #fff; text-decoration: none;">Thanh toán</a>


					</div>
				</div>
				<div style="clear: both;"></div>
				
				<div style="clear: both;"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
