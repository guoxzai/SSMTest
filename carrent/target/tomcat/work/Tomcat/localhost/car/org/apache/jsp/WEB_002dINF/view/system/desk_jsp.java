/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-04-28 14:17:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class desk_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    \r\n");
      out.write("    <title>系统首页</title>\r\n");
      out.write("    \r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/easyui/themes/material/easyui.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/css/wu.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/css/icon.css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/easyui/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/easyui/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body>\r\n");
      out.write("  \t\t<div  class=\"easyui-layout\" style=\"width: 100%;height: 400px\">\r\n");
      out.write("   \t\t<!-- 系统公告 开始-->\r\n");
      out.write("   \t\t\t<div class=\"easyui-panel\" style=\"width: 70%\" data-options=\"region:'center',iconCls:'icon-ok',split:true,border:true,title:'系统公告'\">\r\n");
      out.write("   \t\t\t\t<table id=\"dg\" class=\"easyui-datagrid\"></table>  \r\n");
      out.write("   \t\t\t</div>\r\n");
      out.write("   \t\t<!-- 系统公告 结束-->\r\n");
      out.write("   \t\t\r\n");
      out.write("   \t\t<!-- 日历 开始-->\r\n");
      out.write("   \t\t<div class=\"easyui-panel\" style=\"width: 30%\" data-options=\"region:'east',iconCls:'icon-save',split:true,border:true,title:'系统公告'\">\r\n");
      out.write("   \t\t\t<div id=\"cc\" class=\"easyui-calendar\" data-options=\"border:false\" style=\"width:100%;height:100%;\"></div>\r\n");
      out.write("   \t\t</div>\r\n");
      out.write("   \t\t<!-- 日历 结束-->\r\n");
      out.write("   \t\t</div>\r\n");
      out.write("   \t\t\r\n");
      out.write("   \t\t<div id=\"dlg\" class=\"easyui-dialog\" style=\"width:1000px;height: 600px\"\r\n");
      out.write("\t\tdata-options=\"closed:true,modal:true,border:'thin',collapsible:true,minimizable:true,maximizable:true,closable:true\">\r\n");
      out.write("\t\t\t<form id=\"fm\" method=\"post\" novalidate\r\n");
      out.write("\t\t\t\tstyle=\"margin:0;padding:20px 50px\">\r\n");
      out.write("\t\t\t\t<div style=\"margin-bottom:10px\">\r\n");
      out.write("\t\t\t\t\t<div id=\"title\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"text-align: center;font-size: 25px;font-weight: bold;\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<hr>\r\n");
      out.write("\t\t\t\t<div style=\"margin-bottom:10px;text-align: right;\">\r\n");
      out.write("\t\t\t\t\t发布人:<span id=\"opername\" style=\"margin-right: 30px\"></span>  发布时间:<span id=\"createtime\"></span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<hr>\r\n");
      out.write("\t\t\t\t<div style=\"margin-bottom:10px;\">\r\n");
      out.write("\t\t\t\t\t<div id=\"content\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("   \t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t   \t    $('#cc').calendar({\r\n");
      out.write("\t\t   \t    \tonSelect: function(date){\r\n");
      out.write("\t\t   \t    \t\t$.post('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/news/queryNewsByTime.action',{createtime:date},function(data){\r\n");
      out.write("\t\t   \t    \t\t\t\r\n");
      out.write("\t\t   \t    \t\t});\r\n");
      out.write("\t\t   \t    \t}\r\n");
      out.write("\t\t   \t    });\t\r\n");
      out.write("\t\t   \t    \r\n");
      out.write("\t\t   \t\t$(\"#dg\").datagrid({\r\n");
      out.write("\t\t   \t\t\twidth:'100%',\r\n");
      out.write("\t\t   \t\t\theight:360,\r\n");
      out.write("\t\t   \t\t\trownumbers : true,\r\n");
      out.write("\t\t   \t\t\tsingleSelect : true,\r\n");
      out.write("\t\t   \t\t\turl : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/news/loadAllNews.action',\r\n");
      out.write("\t\t   \t\t\tfitColumns : true,\r\n");
      out.write("\t\t   \t\t\temptyMsg : '<font color=red>查无数据</font>',\r\n");
      out.write("\t\t   \t\t\tpagination : true,\r\n");
      out.write("\t\t   \t\t\tpagePosition : 'bottom',\r\n");
      out.write("\t\t   \t\t\tpageNumber : 1,\r\n");
      out.write("\t\t   \t\t\tpageSize : 10,\r\n");
      out.write("\t\t   \t\t\tpageList : [ 5, 10, 15, 20, 25 ],\r\n");
      out.write("\t\t   \t\t\ttoolbar : '#tb',\r\n");
      out.write("\t\t   \t\t\tcolumns:[ [\r\n");
      out.write("\t\t   \t\t\t           {field:'id',hidden:true},\r\n");
      out.write("\t\t   \t\t\t           {field:'title',title:'新闻标题',width:100,align:'center'},\r\n");
      out.write("\t\t   \t\t\t           {field:'createtime',title:'发布时间',width:100,align:'center'},\r\n");
      out.write("\t\t   \t\t\t           {field:'opername',title:'发布人',width:100,align:'center'},\r\n");
      out.write("\t\t   \t\t\t] ],\r\n");
      out.write("\t\t   \t\t});\r\n");
      out.write("\t\t   \t\t\r\n");
      out.write("\t\t   \t\t$('#dg').datagrid({\r\n");
      out.write("\t\t   \t\t\tonDblClickRow:function(rowIndex,rowData){\r\n");
      out.write("\t\t   \t\t\t\t$.post('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${gxz}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/news/queryNewsById.action',{id:rowData.id},function(data){\r\n");
      out.write("\t\t   \t\t\t\t\t$(\"#dlg\").dialog(\"open\").dialog(\"setTitle\",\"新闻内容\");\r\n");
      out.write("\t\t   \t\t\t\t\t$(\"#title\").html(data.title);\r\n");
      out.write("\t\t   \t\t\t\t\t$(\"#opername\").html(data.opername);\r\n");
      out.write("\t\t   \t\t\t\t\t$(\"#content\").html(data.content);\r\n");
      out.write("\t\t   \t\t\t\t\t$(\"#createtime\").html(data.createtime);\r\n");
      out.write("\t\t   \t\t\t\t});\r\n");
      out.write("\t\t   \t\t\t}\r\n");
      out.write("\t\t   \t\t});\r\n");
      out.write("   \t\t</script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
