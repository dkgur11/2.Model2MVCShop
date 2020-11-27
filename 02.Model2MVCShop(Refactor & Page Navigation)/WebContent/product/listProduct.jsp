
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page" %>
<%@ page import="com.model2.mvc.service.product.vo.*"%>

<%
	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
   Map<String, Object> map = (Map<String, Object>) request.getAttribute("map"); 
   Search search = (Search) request.getAttribute("search");
   Page resultPage =(Page) request.getAttribute("resultPage");
  
   
   String searchCondition = CommonUtil.null2str(search.getSearchCondition());
   String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
  
/*     int total = 0;
   /* List<ProductVO> list = null; */
 /*   if (map != null) {
      total = ((Integer) map.get("count")).intValue();
      list = (List<ProductVO>) map.get("list");
   }
   
   int currentPage = search.getCurrentPage();
   
   int totalPage = 0;
   if (total > 0) {
      totalPage = total / resultPage.getPageUnit();
      if (total % resultPage.getPageUnit() > 0)
         totalPage += 1;
   }  */ 
   	String me =(String)request.getParameter("menu");
%>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
   
   function fncGetProductList(currentPage){
	   document.getElementById("currentPage").value = currentPage;
  		document.detailForm.submit();
   }
/*     function fncSearchConditionCheck() {
      var searchCondition = document.detailForm.searchCondition.value;
      var searchKeyword = document.detailForm.searchKeyword.value;
      
      if(searchKeyword == null){
         alert("�˻�� �Է����ּ���");
      }else{
         if(searchCondition==0 && isNaN(Number(searchKeyword))==true){
            alert("�˻��Ͻ� ��ǰ�� ��ǰ ��ȣ�� �Է����ּ���.");
         } else if(searchCondition==2 && isNaN(Number(searchKeyword))==true){
            alert("�˻��Ͻ� ��ǰ�� ������ �Է����ּ���.");
         } else {
            document.detailForm.submit();
         }
      }
      
   }  */
   

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

   <div style="width: 98%; margin-left: 10px;">

      <form name="detailForm" action="/listProduct.do?menu=<%= me %>" method="post">

         <table width="100%" height="37" border="0" cellpadding="0"
            cellspacing="0">
            <tr>
               <td width="15" height="37">
               <img src="/images/ct_ttl_img01.gif"
                  width="15" height="37" /></td>
               <td background="/images/ct_ttl_img02.gif" width="100%"
                  style="padding-left: 10px;">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <% if("manage".equals(me)) {%>
                        <td  width="93%" class="ct_ttl01">��ǰ ����</td>
                     <% } else {%>
                        <td width="93%" class="ct_ttl01">��ǰ �˻�</td>
                     <% } %>  
                      <td align="left" width="93%" class="ct_ttl01">
                     </tr>
                  </table>
               </td>
             
               <td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
                  width="12" height="37" /></td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <% if(search.getSearchCondition() != null) { %> 
               <td align="right">
                  <select name="searchCondition" class="ct_input_g" style="width: 80px">
                     <% if(search.getSearchCondition().equals("0")){ %>
                        <option value="0" selected>��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     <% } else if(search.getSearchCondition().equals("1")){ %>
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1" selected>��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     <% } else { %>
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2" selected>��ǰ����</option>
                     <% } %>
                  </select> 
                  <input type="text" name="searchKeyword" value = "<%= searchKeyword %>" class="ct_input_g" style="width: 200px; height: 19px" />
               </td>
               
                <% }else{ %>
                  <td align="right">
                     <select name="searchCondition" class="ct_input_g" style="width:80px">
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     </select>
                     <input type="text" name="searchKeyword" value="<%= searchKeyword %>" class="ct_input_g" style="width:200px; height:19px" >
                  </td>
               <% } %> 

               <td align="right" width="70">
                  <table border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td width="17" height="23"><img
                           src="/images/ct_btnbg01.gif" width="17" height="23"></td>
                        <td background="/images/ct_btnbg02.gif" class="ct_btn01"
                           style="padding-top: 3px;"><a
                           href="javascript:fncGetProductList('1');">�˻�</a></td>
                        <td width="14" height="23"><img
                           src="/images/ct_btnbg03.gif" width="14" height="23"></td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td colspan="11" >��ü  <%= resultPage.getTotalCount()%> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
            </tr>
            <tr>
               <td class="ct_list_b" width="100">No</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">��ǰ��</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">����</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">�����</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">�������</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="808285" height="1"></td>
            </tr>

            <%    
               
               for(int i=0; i<list.size(); i++) {
                  ProductVO vo = list.get(i);
                  System.out.println("jsp listsizeȮ�� :"+list.size());
            %>
            <tr class="ct_list_pop">
               <td align="center"><%= i+1%></td>
               <td></td>
               <td align="left">
               <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=<%= me %>" ><%= vo.getProdName() %></a>
               
           <%--  <  <% if(((UserVO)session.getAttribute("user")).getRole().equals("admin") && authorization.equals("manage")) { %>
                  <a href="/updateProductView.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
               <% } else { %>
                   <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
                <% } %>  --%>
                
               </td>
               
               <td></td>
               <td align="left"><%= vo.getPrice() %></td>
               <td></td>
               <td align="left"><%= vo.getRegDate() %></td>
               <td></td>
               <td align="left">
               </td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="D6D7D6" height="1"></td>
            </tr>
            <% } %>
         </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td align="center">
               <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage(); i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>   
               </td>
            </tr>
         </table>
         <!--  ������ Navigator �� -->

      </form>

   </div>
</body>
</html>