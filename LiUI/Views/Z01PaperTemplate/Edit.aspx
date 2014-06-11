﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Z01Beetle.Entity.Z01PaperTemplate>"
    ValidateRequest="false" %>

<%@ Import Namespace="Z01Beetle.Entity" %>
<%@ Import Namespace="Z01Beetle.Entity.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    编辑 单据条款
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="/Content/Scripts/kindeditor/kindeditor-min.js"></script>
    <script type="text/javascript">
        KE.show({
            id: 'Content'
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("form").submit(function () {
                if ($("#Title").val().length > 300) { $.jvalidate('Title', '您输入的内容太多。', 59); return false }
                if (isNaN($("#DisplayOrder").val())) { $.jvalidate('DisplayOrder', '请输入数字。', 59); return false }
            });

            $(".detail.readonly input").attr("readonly", true);

        });
    </script>
    <div id="contents">
        <div id="top">
            <div class="con clearfix">
                <div class="fl">
                    <a href="<%=ViewData["ReturnUrl"]  %>" class="btn img"><i class="icon i_back"></i>返回<b></b></a>
                </div>
            </div>
        </div>
        <div id="main">
            <% using (Html.BeginForm())
               {%>
            <table cellspacing="0" cellpadding="0" border="0" class="detail <% if (ViewData["IsDetail"]!=null){ Response.Write("readonly");}%>">
                <caption>
                    <h3 id="title">
                        <%=ViewData["VTitle"]%></h3>
                </caption>
                <tr>
                    <td class="tt">
                        标题：
                    </td>
                    <td class="tc" colspan="3">
                        <%= Html.TextBox("Title", Model.Title, new { @class = "text w300" })%>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="tt">
                        内容：
                    </td>
                    <td class="tc" colspan="3">
                        <%= Html.TextArea("Content", Model.Content, new { @class = "textarea w600" })%>
                    </td>
                    <td>
                    </td>
                </tr>
                <% if (ViewData["IsDetail"] == null)
                   { %>
                <tr class="action">
                    <td>
                    </td>
                    <td class="tc">
                        <input type="submit" value="保存" class="gbutton mr20" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
            </table>
            <%} %>
        </div>
    </div>
</asp:Content>
